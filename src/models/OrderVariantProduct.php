<?php
include '../config/config.php';

class OrderVariantProduct
{
    public function create($orderId, $vprId, $quantity)
    {
        global $pdo;
    
        // Ambil harga per unit dari variantproduct
        $stmt = $pdo->prepare("SELECT vpr_harga FROM variantproduct WHERE vpr_id = ?");
        $stmt->execute([$vprId]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
        if ($row) {
            $pricePerUnit = $row['vpr_harga'];
            $subtotal = $pricePerUnit * $quantity;
    
            // Insert data dengan subtotal yang dihitung
            $stmt = $pdo->prepare("INSERT INTO ordervariantproduct (ord_id, vpr_id, ovp_jumlah, ovp_harga, ovp_status) VALUES (?, ?, ?, ?, 1)");
            $stmt->execute([$orderId, $vprId, $quantity, $subtotal]);
        } else {
            throw new Exception("Variant product not found.");
        }
    }
    

    public function getByOrderId($orderId)
    {
        global $pdo;
        $stmt = $pdo->prepare("SELECT * FROM ordervariantproduct WHERE ord_id = ?");
        $stmt->execute([$orderId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getPriceById($vprId)
    {
        global $pdo;
        $stmt = $pdo->prepare("SELECT vpr_harga FROM variantproduct WHERE vpr_id = ?");
        $stmt->execute([$vprId]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row ? $row['vpr_harga'] : 0;
    }
}
?>
