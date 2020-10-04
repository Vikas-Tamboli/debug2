 #!/bin/bash

 file="infra/.terraform"

 if[ -d $file ]
 then 
	 exit
 else
	 cd infra
	 terraform init
	 cd -
 fi
	 
	
