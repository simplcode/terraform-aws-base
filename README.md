# Terraform configuration template (Draft)

Terraform으로 AWS인프라 구축시 마다 반복해서 사용되던 리소스들을 Terraform registry 중 Hashicorp 공인 파트너사에서 제공하는 모듈로 정의, IaC 프로젝트를 위한 탬플릿으로 활용하고자 합니다. 다만, 공식 모듈이 존재하지 않거나 프로젝트에 적합하지 않은 경우 직접 정의한 모듈을 사용합니다.

## 범위
AWS Profile과 Terraform CLI가 설치된 Local 환경에서 variable 파일 수정만으로 사용할 수 있도록 단순하게 구성. 추가 설정이 필요한 Github Action, Terraform cloud 또는 atlantis, packer등을 사용한 구성은 따로 작성.

### 모듈
- Network 관련(VPC, Security Group, Routing Table,... etc.)
- Route53
- EC2
- RDS
- S3
- SQS
- Fargate*

----
*custom module
