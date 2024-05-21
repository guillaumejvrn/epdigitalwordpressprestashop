<?php

function generateDockerComposeFile($instanceNumber, $hostPort) {
    $template = file_get_contents('docker-compose-template.yml');
    if ($template === false) {
        die("Erreur : Impossible de lire le modèle docker-compose-template.yml");
    }

    $content = str_replace('${HOST_PORT}', $hostPort, $template);

    $directory = "wordpress_instance_$instanceNumber";
    if (!is_dir($directory)) {
        mkdir($directory);
    }

    $filePath = "$directory/docker-compose.yml";
    file_put_contents($filePath, $content);

    // Debug: Vérifiez le contenu du fichier généré
    echo "Généré pour l'instance $instanceNumber : <pre>" . htmlspecialchars($content) . "</pre><br>";
}

function deployInstance($instanceNumber) {
    $directory = "wordpress_instance_$instanceNumber";
    exec("cd $directory && docker-compose up -d 2>&1", $output, $return_var);
    if ($return_var !== 0) {
        echo "Erreur lors du déploiement de l'instance $instanceNumber : " . implode("\n", $output);
    } else {
        echo "Instance $instanceNumber déployée avec succès.<br>";
    }
}

$numInstances = 10; // Nombre d'instances à déployer
$startingPort = 8000; // Port de départ

for ($i = 1; $i <= $numInstances; $i++) {
    $port = $startingPort + $i;
    generateDockerComposeFile($i, $port);
    deployInstance($i);
}

echo "Déploiement de $numInstances instances de WordPress terminé.";
?>
