<?php 
include('../../conexao.php');



//CARREGAR DOMPDF
require_once '../../dompdf/autoload.inc.php';
use Dompdf\Dompdf;
use Dompdf\Options;

$options = new Options();
$options->set('isRemoteEnabled', true);
$pdf = new Dompdf($options);


$id = $_GET['id'];

//ALIMENTAR OS DADOS NO RELATÓRIO
$html = utf8_encode(file_get_contents($url_sistema."/painel-atend/rel/rel_ficha_consulta.php?id=".$id));



//Definir o tamanho do papel e orientação da página
$pdf->setPaper('A4', 'portrait');

//CARREGAR O CONTEÚDO HTML
$pdf->loadHtml(utf8_decode($html));

//RENDERIZAR O PDF
$pdf->render();
ob_end_clean();
//NOMEAR O PDF GERADO
$pdf->stream(
'relatorioFichaConsulta.pdf',
array("Attachment" => false)
);


