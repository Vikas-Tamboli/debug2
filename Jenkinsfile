pipeline{
  agent any
  environment {
	AC_KEY = credentials('AWS_ACCESS_KEY')
	SEC_KEY = credentials('AWS_SECRET_KEY')

}
  
  parameters {
   choice(
       choices: ['apply' , 'destroy'],
       description: 'Perform action on infrastructure!',
       name: 'ACTION')
}
  stages {
   stage("Opening"){
         steps{
            //Welcome message
            script{
               sh "cowsay welcome"
               sh "cowsay blablablablabla"
               sh "echo 'Welcome to Jenkins'"
}
}
}

   stage("Workspace_cleanup"){
        //Cleaning WorkSpace
        steps{
            step([$class: 'WsCleanup'])
}
}

   stage("Repo_clone"){
       //Clone repo from GitHub
      steps {
         checkout ([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[credentialsId: 'jenkins', url: 'git@github.com:Vikas-Tamboli/debug2.git']]])

}
}
   stage("terraform_init"){
     //terraform init
     steps{
      script{
       sh "cowsay terraform init"
       sh "bash plugins.sh" 
}
}
}

   stage("static_analysis"){
     //static analysis
       when {
        //only terraform apply if a "apply" is requested
        expression { params.ACTION == 'apply'}
}
      steps{
       script{
       sh '''
            cowsay static_analysis
            cd infra
            terraform validate 
            cd -
       '''
}
}
}

   stage("terraform_plan"){
     //terraform plan
       when {
        //only terraform apply if a "apply" is requested
        expression { params.ACTION == 'apply'}
}
      steps{
       script{
       sh '''
            cowsay terraform_plan
            cd infra
            terraform plan -var "a_key=$AC_KEY" -var "s_key=$SEC_KEY"
            cd -
       '''
}
}
}


   stage("terraform_apply"){
    //terraform apply
     when {
        //only terraform apply if a "apply" is requested
        expression { params.ACTION == 'apply'}
}
     steps{
      script{
       sh '''
            cowsay terraform_apply
            cd infra
            terraform apply --auto-approve -var "a_key=$AC_KEY" -var "s_key=$SEC_KEY"

            cd -
       '''

}
}
}



   stage("terraform_destroy"){
    //terraform destroy
     when {
        //only terraform destroy if a "destroy" is requested
        expression { params.ACTION == 'destroy'}
}
     steps{
      script{
       sh '''
            cowsay terraform_destroy
            cd infra
            terraform destroy --auto-approve -var "a_key=$AC_KEY" -var "s_key=$SEC_KEY"

            cd - 
       ''' 

}
}
}


}
}

