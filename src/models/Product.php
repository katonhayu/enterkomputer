<?php
include '../config/config.php';

class Product
{
    public function getAll()
    {
        global $pdo;
        $stmt = $pdo->query("SELECT * FROM product");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getById($id)
    {
        global $pdo;
        $stmt = $pdo->prepare("SELECT * FROM product WHERE pro_id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function create($data)
    {
        global $pdo;
        $stmt = $pdo->prepare("INSERT INTO product (pro_nama, pro_kategori, pro_status) VALUES (?, ?, ?)");
        $stmt->execute([$data['pro_nama'], $data['pro_kategori'], $data['pro_status']]);
    }

    public function update($id, $data)
    {
        global $pdo;
        $stmt = $pdo->prepare("UPDATE product SET pro_nama = ?, pro_kategori = ?, pro_status = ? WHERE pro_id = ?");
        $stmt->execute([$data['pro_nama'], $data['pro_kategori'], $data['pro_status'], $id]);
    }

    public function delete($id)
    {
        global $pdo;
        $stmt = $pdo->prepare("DELETE FROM product WHERE pro_id = ?");
        $stmt->execute([$id]);
    }
}
?>
