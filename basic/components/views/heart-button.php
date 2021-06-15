<div class="heart-wrapper">

    <svg id="<?= "heart_{$type}_{$content}" ?>" class="<?= $heartStatus ?> heart-link" data-type="<?= $type ?>" data-content="<?= $content ?>"><path/></svg>

    <?php if(isset($count)): ?>
        <p id="<?= "heartCount_{$type}_{$content}" ?>"><?= $count > 0 ? $count : 0 ?></p>
    <?php endif ?>

</div>