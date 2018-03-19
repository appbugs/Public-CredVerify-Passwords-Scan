param(
[string] $inputFile
);

$api_key="Your_api_key_from_VeriClouds"
$api_secret="Your_api_secret_from_VeriClouds"
$coverage="all_passwords"
$disable_cache="false"
$mode="search_leaked_passwords_with_hash_segment"

$bodyFormat = "api_key=$api_key&api_secret=$api_secret&coverage=$coverage&disable_cache=$disable_cache&hash_segment={0}&mode=$mode"

$allHashes = get-content $inputFile

Write-Output "Password Hash, Leaked"

$allHashes | foreach {

    $body = $bodyFormat -f $_.Substring(0,6)    

    $result = curl -Uri "https://api.vericlouds.com" -Method Post -ContentType "application/x-www-form-urlencoded; charset=utf-8" -Body $body

    if ($result.Content.ToLower().Contains($_.ToLower()))
    {
        Write-Output "$_, Yes"
    }
    else
    {
        Write-Output "$_, No"
    }
}