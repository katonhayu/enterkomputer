<?php
include '../config/config.php';

class OrderPromo
{
    public function create($orderId, $promoId, $quantity)
    {
        global $pdo;
    
        // Ambil harga per unit dari promo
        $stmt = $pdo->prepare("SELECT prm_harga FROM promo WHERE prm_id = ?");
        $stmt->execute([$promoId]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
        if ($row) {
            $pricePerUnit = $row['prm_harga'];
            $subtotal = $pricePerUnit * $quantity;
    
            // Insert data dengan subtotal yang dihitung
            $stmt = $pdo->prepare("INSERT INTO orderpromo (ord_id, prm_id, opr_jumlah, opr_harga, opr_status) VALUES (?, ?, ?, ?, 1)");
            $stmt->execute([$orderId, $promoId, $quantity, $subtotal]);
        } else {
            throw new Exception("Promo not found.");
        }
    }
    

    public function getByOrderId($orderId)
    {
        global $pdo;
        $stmt = $pdo->prepare("SELECT * FROM orderpromo WHERE ord_id = ?");
        $stmt->execute([$orderId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getPriceById($prmId)
    {
        global $pdo;
        $stmt = $pdo->prepare("SELECT prm_harga FROM promo WHERE prm_id = ?");
        $stmt->execute([$prmId]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row ? $row['prm_harga'] : 0;
    }
    
}
?>
