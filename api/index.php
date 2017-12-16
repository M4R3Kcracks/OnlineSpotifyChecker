<?php
include('class.spotify.php');
$spotify = new spotify();
echo $spotify->check($_GET['u'], $_GET['p']);