<h1>Testing scripts handling</h1>
<?php
// Display server info

echo "<pre>";

echo "\n" . '$_SERVER =>' . "\n";
print_r($_SERVER);

echo "\n" . '$_GET =>' . "\n";
print_r($_GET);

echo "\n" . '$_ENV =>' . "\n";
print_r($_ENV);
