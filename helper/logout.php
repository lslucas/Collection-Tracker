<?php

	session_start();
	$_SESSION['ct'] = array();
	session_destroy();

	echo 'Você saiu!';
