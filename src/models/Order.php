<?php
include '../config/config.php';

class Order
{
    public function create($mejaId)
    {
        global $pdo;
        $stmt = $pdo->prepare("INSERT INTO `order` (meja_id, ord_waktu, ord_total, ord_status) VALUES (?, NOW(), 0, 1)");
        $stmt->execute([$mejaId]);
        return $pdo->lastInsertId();
    }
    
    public function updateTotal($orderId, $total)
    {
        global $pdo;
        $stmt = $pdo->prepare("UPDATE `order` SET ord_total = ? WHERE ord_id = ?");
        $stmt->execute([$total, $orderId]);
    }


    public function getById($orderId)
    {
        global $pdo;
        $stmt = $pdo->prepare("SELECT * FROM `order` WHERE ord_id = ?");
        $stmt->execute([$orderId]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function getAll()
    {
        global $pdo;
        $stmt = $pdo->query("SELECT * FROM `order`");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>
