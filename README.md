# aws-eb-env-creation-script
Base setup with required configurations and script to create auto scalable environments using AWS EB service

# Why?
Because this automation process would help us to ensure that environments are created with the defined configuration automatically. So to save time and minimize all the manual effort that we put for instance setup, this script comes as a savior.

**Please note** that any backend app deployment can be automated as well but deployment automation is not considered as part of this.

# Script - eb-app-create.sh
## Purpose
To initialize the application and create environment within the initialized app. The same can be verified from the AWS EB console.

### Parameters definition
  - $1: App name
  - $2: Environment Name (preferably value = dev/qa/prod)
  - $3: Shared load balancer name (Note: Need to create a new one if not created)

# Steps To Run
### Prerequisites
1. AWS Cli must be setup:
    - [For windows](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html)
    - [For macOs](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)
2. EB Cli must be setup:
    - [Steps to setup aws eb cli](https://github.com/aws/aws-elastic-beanstalk-cli-setup)

### Steps:
1. Clone this repo - https://github.com/VikashChoudahry/aws-eb-env-creation-script.git
2. Switch to the script directory.
3. Run: `./eb-app-create.sh learn-and-share-app dev-env <shared_alb_name>`
4. On successful execution, we should see - `EB app creation completed ...!!` once script finishes it's execution.
    
**Note:** For script parameters reference, refer to the `parameters definition` section

# Want to create multiple environments?
No worries! Simply follow the below steps and you will be done with env creation within 5 mins (if no major config change required ).

1. Create a copy of `learn-and-share-app-dev-env` folder.
2. If required, make a necessary config property value update based on the requirement for the specific environment.
3. Switch to the created folder (refer step #2).
4. Execute the `eb-app-create.sh` script.
5. Done.

**Note:** The `eb-app-create.sh` script look for a specific directory based on the passed parameters (refer `Parameters Definition`) section. So if you rename the folder after copying then the same folder name must be updated in the script as well.

# Known Facts:

1. If we terminate the script during the execution, the cleanup is not in place and we may see a stale file(s)/folder(s) created. So, at present we might have to remove them manually.

2. When we execute the `eb-app-create.sh` script, initially there won't be any source code to be deployed so it might create the application and env using sample source code.
  
    **Log message:**

    `NOTE: The current directory does not contain any source code. Elastic Beanstalk is launching the sample application instead.`

- The used configurations as part of this code base is used for reference only. When you want to use this for your own project ensure that expected configuration values are set before you start the env creation.

- The added script is a production ready script and can be used for your own project by adding necessary configuration property values as per the project's need.

> If you want to go through step-by-step procedure then you may follow this blog: [aws-eb-create-autoscalable-instance](https://www.learnandshare.live/blogs/blog-details/6/aws-eb-create-autoscalable-instance).


Need help? Please drop an email at `servikash@gmail.com`