// This is a template file for a basic deployment.
// Modify the parameters below with actual values
module "sample-qs" {
  source = "./modules/sample-module"

  path_to_build_spec = "../amplify.yml"

  # - Amplify App -
  # Connect Amplify to GitHub
  #existing_repo_url              = "https://github.com/your-repo-url"
  #lookup_ssm_github_access_token = true                                 // set to true if the resource exists in your AWS Account
  #ssm_github_access_token_name   = "Enter-Your-SSM-Parameter-Store-Key" // name of the parameter in SSM

  cognito_groups = {
    Admin : {
      name        = "Admin"
      description = "Admin users"
    },
    Standard : {
      name        = "Standard"
      description = "Standard users"
    },
  }
  cognito_users = {
    # Admin Users to create
    MatthewReynolds : {
      username         = "mreynolds"
      given_name       = "Matthew"
      family_name      = "Reynolds"
      email            = "reynolds_matthew_tet@student.smc.edu"
      email_verified   = true // no touchy
      group_membership = ["Admin", "Standard"]
    },
    # Standard Users to create
    TestStandard : {
      username         = "teststandard"
      given_name       = "Test"
      family_name      = "Standard"
      email            = "tetsuoreynolds@gmail.com"
      email_verified   = true // no touchy
      group_membership = ["Standard"]
    }
  }

}
