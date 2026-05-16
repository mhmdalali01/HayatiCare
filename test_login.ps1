$body = @{
    email = "admin@hmss.local"
    password = "00000000"
} | ConvertTo-Json

$result = Invoke-RestMethod -Uri "http://10.21.131.176:5000/api/auth/login" -Method Post -Body $body -ContentType "application/json"
$result