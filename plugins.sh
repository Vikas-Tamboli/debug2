 #!/bin/bash

 file="infra/.terraform"

 if[ -d $file ]
 then 
	 exit
 else
	 cd file 
	 terraform init
	 cd -
 fi
	 
	
