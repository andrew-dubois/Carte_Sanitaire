<?php
$filename= $_SERVER["REQUEST_URI"];
$class_focusitem_p1="";
$class_focusitem_p2="";
$class_focusitem_p3="";
$class_focusitem_p4="";
$class_focusitem_p5="";
switch($filename){
//Homepage
case '/cs/index.php':
$class_focusitem_p1='focusMenuItem';
break;

//cartographie
case '/cs/dcart.php':
$class_focusitem_p2='focusMenuItem';
break;

//dashboard
case '/cs/dashboard.php':
$class_focusitem_p3='focusMenuItem';
break;

//search
case '/cs/search.php':
$class_focusitem_p4='focusMenuItem';
break;

//Demographie
case '/cs/dpop.php':
$class_focusitem_p5='focusMenuItem';
break;

}

?>
<li><a href="index.php" class="<?php echo $class_focusitem_p1 ?> mIcon homeicon">Accueil</a></li>            
            <li><a href="dcart.php" class="<?php echo $class_focusitem_p2 ?> mIcon mapicon">Cartographie</a></li>
            <li><a href="dashboard.php" class="<?php echo $class_focusitem_p3 ?> mIcon sitemapicon">Tableau de bord</a></li>
            <li><a href="search.php" class="<?php echo $class_focusitem_p4 ?> mIcon docicon">Recherche</a></li>
			<!--<li><a href="dpop.php" class=" <?php echo $class_focusitem_p5 ?> mIcon abouticon">D&eacute;mographie</a>-->
</li>