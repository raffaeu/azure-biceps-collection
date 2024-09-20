# Azure Bicep collection

This project contains a list of Bicep Modules, Bicep "patterns" and Azure DevOps pipelines to get you started. All modules and patterns are parameterized, so it is easy to pick-up one pattern and customize it. Each pipeline has a **create** and a **delete** version.

## Project structure

```
core/
└── service.module.bicep
pipelines/
├── pattern-create.yml
└── pattern-delete.yml
patterns/
└── pattern.main.bicep
web/
└── service.module.bicep
ai/
└── service.module.bicep
README.md
```
