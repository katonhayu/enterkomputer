<?php
include '../config/config.php';
include '../src/models/Product.php';

class ProductController
{
    private $product;

    public function __construct()
    {
        $this->product = new Product();
    }

    public function getAllProducts()
    {
        $products = $this->product->getAll();
        echo json_encode($products);
    }

    public function getProduct($id)
    {
        $product = $this->product->getById($id);
        echo json_encode($product);
    }

    public function createProduct()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $this->product->create($data);
        echo json_encode(['status' => 'Product created']);
    }

    public function updateProduct($id)
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $this->product->update($id, $data);
        echo json_encode(['status' => 'Product updated']);
    }

    public function deleteProduct($id)
    {
        $this->product->delete($id);
        echo json_encode(['status' => 'Product deleted']);
    }
}
?>
