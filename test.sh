USER_ID="ylasmak"
KEY="cfa23cbd4ee448fda0eecebf82b6cf99"

#URL="https://api.sandbox.namecheap.com/xml.response?ApiUser=$USER_ID&ApiKey=$KEY&UserName=$USER_ID&Command=namecheap.ssl.create&ClientIP=66.131.32.109&Years=2&Type=PositiveSSL"




# CSR=$(cat server.csr | base64)
CSR="-----BEGIN+CERTIFICATE+REQUEST-----%0AMIICsTCCAZkCAQAwHjEcMBoGA1UEAwwTYXBpLmNsb3VkcmVhZHkuY2x1YjCCASIw%0ADQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALna0eLcjxoe0ezqjoAQY5ZryJOz%0APL%2BOsAZXA7KgWiojRxKHBPt9ulDnvFr1%2BJDXOfosyWHjQPqK/XMz12RakoDX61Ur%0AQKtQ4WjVZ8kdUlaqK7EH/P6inZGCCPFgFldXOUECOctz4ZNfipJEd3Guw0XgQdN3%0A%2BIHBmDm199qlds65zZNcHSW%2BbNro6SkHe3FdxC1IhvA2snUI/k055Ciq5XKNizQN%0AAcYsNESPuJBfNqQbLG60IM2vFXiI%2BgH8g5/CN/kaPmcKT%2BRUaxADIor1LTh%2B%2B%2Bci%0AfOA3CppRLWDpnkr1wCXcU1FMip%2BLXV8r%2BK3tFh9%2BQlUUyiXL0UktAaPnVuMCAwEA%0AAaBOMEwGCSqGSIb3DQEJDjE/MD0wOwYDVR0RBDQwMoIXYXBpLmFwaS5jbG91ZHJl%0AYWR5LmNsdWKCF3d3dy5hcGkuY2xvdWRyZWFkeS5jbHViMA0GCSqGSIb3DQEBCwUA%0AA4IBAQBpzP6tWXyRpqbpviOpO4XwpyHMQq9UqHznwqQKF9NL%2BZQcboGgQprODl1Q%0AK4vknnpzqdVsWqjix/NdBqp9U%2BCsiFghbxFsOVO6qN06K6XTqSaYtrMTktRfAJks%0AA9ljaksvsM7W3TmId/BcD56Vr17SKg9USkwbSWKkbVuRFj5x3N6GrJ3mXqaLk8nZ%0Awf33M5C7fXisO/ytqPXh0se2KcuxivBlACmvKHXKIYgQkdXxNlqPhDQraV7oXu0I%0A074hdhP3wk8ZLaXI2LFGhcuaXTt3RSdTauDax7rPMwXqW2H3XR/b0a%2BPLnMi4eCY%0AUrscO5ju0LpqOqG5Kq5qwO2%2BzJJk%0A-----END+CERTIFICATE+REQUEST-----"
E_MAIL="youness.lasmak@cloudready.club"
URL="https://api.sandbox.namecheap.com/xml.response?ApiUser=$USER_ID&ApiKey=$KEY&UserName=$USER_ID&Command=namecheap.ssl.activate&ClientIp=66.131.32.109&CertificateID=2244748&AdminEmailAddress=$E_MAIL&WebServerType=apacheopenssl&DNSDCValidation=true&ApproverEmail=CNAMECSRHASH&csr=$CSR"
URL="https://api.sandbox.namecheap.com/xml.response"
PARMS="ApiUser=$USER_ID&ApiKey=$KEY&UserName=$USER_ID&Command=namecheap.ssl.activate&ClientIp=66.131.32.109&CertificateID=2244748&AdminEmailAddress=$E_MAIL&WebServerType=apacheopenssl&DNSDCValidation=true&ApproverEmail=CNAMECSRHASH&csr=$CSR"
PARMS_REISSUE="ApiUser=$USER_ID&ApiKey=$KEY&UserName=$USER_ID&Command=namecheap.ssl.reissue&ClientIp=66.131.32.109&CertificateID=2244748&AdminEmailAddress=$E_MAIL&WebServerType=apacheopenssl&DNSDCValidation=true&ApproverEmail=CNAMECSRHASH&csr=$CSR"

PARAM_STATUS="ApiUser=$USER_ID&ApiKey=$KEY&UserName=$USER_ID&Command=namecheap.ssl.getinfo&ClientIp=66.131.32.109&CertificateID=2244748&returncertificate=true&returntype=individual"

curl -G -d $PARAM_STATUS $URL



