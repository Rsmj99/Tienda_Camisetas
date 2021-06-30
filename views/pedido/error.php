<h1>No se pudo realizar la compra debido a lo siguiente: </h1>
<?php foreach($msg_error as $msg): ?>
    <ul>
        <li>
            <?=$msg?>
        </li>
    </ul>
<?php endforeach; ?>