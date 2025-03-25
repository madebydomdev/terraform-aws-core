<div align="center">

  <h3>Core Infrastructure</h3>

![Terraform]
![AWS]

</div>

Shared infrastructure, such as VPCs, should be configured as part of this repository.

## Initializing Remote State

> [!IMPORTANT]
> Initially, configure a local state, this will be needed to allow provisioning the remote state infrastructure. Namely, the S3 bucket. Once provisioned follow the rest of this section.

Create a `state.config` file in the root directory and add:

```
profile = "some profile"
```

Then initialize the Terraform state using:

```zsh
terraform init -backend-config="./state.config"
```

Now the state is in a central location allowing collaborative work.

<!-- MARKDOWN LINKS & IMAGES -->

[Terraform]: https://img.shields.io/badge/Terraform-844FBA?style=flat&logo=terraform&logoColor=white
[AWS]: https://img.shields.io/badge/-232F3E?logo=amazonwebservices
