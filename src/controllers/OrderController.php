<?php
include '../src/models/Order.php';
include '../src/models/OrderPromo.php';
include '../src/models/OrderVariantProduct.php';

class OrderController
{
    private $order;
    private $orderPromo;
    private $orderVariantProduct;

    public function __construct()
    {
        $this->order = new Order();
        $this->orderPromo = new OrderPromo();
        $this->orderVariantProduct = new OrderVariantProduct();
    }

    public function createOrder()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $mejaId = $data['meja_id'];
        $items = $data['items'];
    
        // Start a transaction
        global $pdo;
        $pdo->beginTransaction();
        
        try {
            // Create order
            $orderId = $this->order->create($mejaId);
            
            $total = 0;
            
            // Process items
            foreach ($items as $item) {
                if (isset($item['vpr_id'])) {
                    $price = $this->orderVariantProduct->getPriceById($item['vpr_id']);
                    $subtotal = $price * $item['quantity'];
                    $total += $subtotal;
                    $this->orderVariantProduct->create($orderId, $item['vpr_id'], $item['quantity']);
                } elseif (isset($item['prm_id'])) {
                    $price = $this->orderPromo->getPriceById($item['prm_id']);
                    $subtotal = $price * $item['quantity'];
                    $total += $subtotal;
                    $this->orderPromo->create($orderId, $item['prm_id'], $item['quantity']);
                }
            }
            
            // Update order total
            $this->order->updateTotal($orderId, $total);
            
            // Commit transaction
            $pdo->commit();
    
            // Determine print recommendations
            $printRecommendations = $this->generatePrintRecommendations($items);
            
            echo json_encode([
                'status' => 'Order created',
                'ord_id' => $orderId,
                'print_recommendations' => $printRecommendations
            ]);
    
        } catch (Exception $e) {
            // Rollback transaction
            $pdo->rollBack();
            echo json_encode(['error' => $e->getMessage()]);
        }
    }
    
    

    private function generatePrintRecommendations($items)
    {
        $recommendations = [
            ['printer' => 'Printer1', 'items' => []],
            ['printer' => 'Printer2', 'items' => []]
        ];

        foreach ($items as $item) {
            if (isset($item['vpr_id'])) {
                // Example logic to determine printer
                if (in_array($item['vpr_id'], [1, 5])) {
                    $recommendations[0]['items'][] = $item['vpr_id'];
                } else {
                    $recommendations[1]['items'][] = $item['vpr_id'];
                }
            } elseif (isset($item['prm_id'])) {
                // Example logic for promo
                $recommendations[1]['items'][] = $item['prm_id'];
            }
        }
        
        return $recommendations;
    }

    public function getBill($orderId)
    {
        $order = $this->order->getById($orderId);
        if (!$order) {
            echo json_encode(['error' => 'Order not found']);
            return;
        }

        $items = array_merge(
            $this->orderVariantProduct->getByOrderId($orderId),
            $this->orderPromo->getByOrderId($orderId)
        );

        echo json_encode([
            'order' => $order,
            'items' => $items
        ]);
    }
}
?>
