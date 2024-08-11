<?php
header("Content-Type: application/json");
include '../config/config.php';
include '../src/controllers/ProductController.php';
include '../src/controllers/OrderController.php';

// Mendapatkan URI tanpa skrip nama
$request = str_replace('/enter_komputer_api/public/index.php', '', $_SERVER['REQUEST_URI']);
$method = $_SERVER['REQUEST_METHOD'];

// Routing untuk Product
if ($request == '/product' && $method == 'GET') {
    $controller = new ProductController();
    $controller->getAllProducts();
} elseif (preg_match('/^\/product\/(\d+)$/', $request, $matches) && $method == 'GET') {
    $controller = new ProductController();
    $controller->getProduct($matches[1]);
} elseif ($request == '/product' && $method == 'POST') {
    $controller = new ProductController();
    $controller->createProduct();
} elseif (preg_match('/^\/product\/(\d+)$/', $request, $matches) && $method == 'PUT') {
    $controller = new ProductController();
    $controller->updateProduct($matches[1]);
} elseif (preg_match('/^\/product\/(\d+)$/', $request, $matches) && $method == 'DELETE') {
    $controller = new ProductController();
    $controller->deleteProduct($matches[1]);
}
elseif ($request == '/order' && $method == 'POST') {
    $controller = new OrderController();
    $controller->createOrder();
} elseif (preg_match('/^\/bill\/(\d+)$/', $request, $matches) && $method == 'GET') {
    $controller = new OrderController();
    $controller->getBill($matches[1]);
}
else {
    http_response_code(404);
    echo json_encode(['error' => 'Endpoint not found']);
}
?>
