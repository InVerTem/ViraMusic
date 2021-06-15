<?php if($file || $text): ?>
    <p class="svg-grid start-audio" <?= $file ? "data-popup-hint=\"{$file}\"" : '' ?> data-type="<?= $type ?>" data-content="<?= $content ?>" data-track="<?= $track ?>" data-order="<?= $order ?>">
<?php endif ?>

        <svg id="<?= "play_{$type}_{$content}_{$track}" ?>" class="play-fill<?= (!($file || $text) ? ' start-audio' : '') ?>" data-type="<?= $type ?>" data-content="<?= $content ?>" data-track="<?= $track ?>" data-order="<?= $order ?>" <?= $user ? "data-user=\"{$user}\"" : '' ?>><path/></svg>

        <?php if($text): ?>
            <?= $text ?>
        <?php endif ?>

<?php if($file): ?>
    </p>
<?php endif ?>