# local settings for keycloak, manually set these values in admin console http://localhost:30080
$username = "test01"
$password = "1234"
$clientid = "my_api"
$clientsecret = "0DnEwbVdjrxyMD83AdjJewgRxlQKTKiC"
$realmname = "test-realm"

[hashtable]$objectProperty = @{}
$objectProperty.Add('realmname',$realmname)
$objectProperty.Add('pwd',$password)
$objectProperty.Add('usr',$username)
$objectProperty.Add('clientId',$clientid)
$objectProperty.Add('clientsecret',$clientsecret)
$objectProperty.Add('url', "http://localhost:30080/auth/realms/${realmname}/protocol/openid-connect/token")

$objectProperty

# login to keycloak and create a realm, client, user
curl --location --request POST "http://localhost:30080/realms/${realmname}/protocol/openid-connect/token" `
--header "Content-Type: application/x-www-form-urlencoded" `
--data-urlencode "client_id=${clientid}" `
--data-urlencode "client_secret=${clientsecret}" `
--data-urlencode "grant_type=password" `
--data-urlencode "username=${username}" `
--data-urlencode "password=${password}"
