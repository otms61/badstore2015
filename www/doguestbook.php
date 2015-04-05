<?php
session_start();
require_once ('../config.php');
print_header();

try {
    $dbh = new PDO(DSN, DBUSER, DBPASSWORD);
} catch(PDOException $e) {
    print ('Error:' . $e->getMessage());
    die();
}

// $dbh->query("INSERT INTO guestbooks (name, email, comment) VALUES ('" . $_POST['name'] . "', '" . $_POST['email'] . "', '" . $_POST['comment'] . "' )");
if (isset($_POST['name'])) {
    $stmt = $dbh->prepare("INSERT INTO guestbooks (name, email, comment, url) VALUES (:name, :email, :comment, :url)");
    $stmt->bindParam(':name', $_POST['name']);
    $stmt->bindParam(':email', $_POST['email']);
    $stmt->bindParam(':comment', $_POST['comment']);
    $stmt->bindParam(':url', $_POST['url']);
    $stmt->execute();
}

$select_sql = "SELECT name, email, comment, url FROM guestbooks";
foreach ($dbh->query($select_sql) as $row) {
?>

<b><?php echo $row['name']; ?></b>
<a href="mailto:<?php echo $row['email']; ?>"> <?php echo $row['email']; ?> </a>
<br>
<?php 
if (isset($row['url'])) {
    echo '<a href="' . htmlspecialchars($row['url'], ENT_QUOTES, 'UTF-8') .'"> page </a>';
}
?>
<ol><i><?php echo htmlspecialchars($row['comment'], ENT_QUOTES, 'UTF-8'); ?></i></ol>
<hr>
 
<?php
}
print_footer();
