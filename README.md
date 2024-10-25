# Azure Landing Zone - Data Platform Deployment

[![Build Status](https://github.com/tnhtnh/alz-platform/workflows/01%20Azure%20Landing%20Zones%20Continuous%20Integration/badge.svg)](https://github.com/tnhtnh/alz-platform/actions)
[![Deployment Status](https://github.com/tnhtnh/alz-platform/workflows/02%20Azure%20Landing%20Zones%20Continuous%20Delivery/badge.svg)](https://github.com/tnhtnh/alz-platform/actions)

This project implements a specialized Data Platform Landing Zone within the Azure Landing Zone framework, focusing on Microsoft Fabric workloads with integrated cost management and security controls.

## Architecture Overview

```mermaid
graph TB
    subgraph "Enterprise Scale Landing Zone"
        MG[Management Groups] --> P[Platform]
        MG --> LZ[Landing Zones]
        
        subgraph "Platform Management Groups"
            P --> C[Connectivity]
            P --> I[Identity]
            P --> M[Management]
        end

        subgraph "Landing Zone Management Groups"
            LZ --> DP[Data Platform]
            
            subgraph "Data Platform Components"
                DP --> FB[Microsoft Fabric]
                DP --> CM[Cost Management]
                FB --> FW[Workspaces]
                FB --> FC[Capacities]
                CM --> BD[Budget Dashboard]
                CM --> BA[Budget Alerts]
            end
        end
    end

    subgraph "Governance"
        POL[Policies] --> RT[Resource Types]
        POL --> LOC[Locations]
        POL --> CST[Cost Controls]
    end
```

## Features
* *Microsoft Fabric Focus*: Specialized landing zone for Microsoft Fabric workloads
* *Cost Control*:
  * Integrated cost management dashboard
  * Multi-threshold budget alerts (50%, 75%, 90%, 100%)
  * Monthly budget tracking and reporting
* *Security & Governance*:
  * Strict resource type controls
  * Geographic boundary enforcement
  * Network security policies
* *Automated Deployment*:
  * Infrastructure as Code using Terraform
  * CI/CD pipelines for reliable deployments
  * Configuration validation



## Prerequisites
* Azure Subscription with Owner permissions
* Azure CLI (version 2.50.0 or higher)
* Terraform (version ~> 1.8)
* GitHub Actions (for CI/CD)

## Custodianship
| Role | Responsibility | Contact |
|------|----------------|---------|
| Platform Owner | Overall platform architecture and strategy | @platform-team |
| Security Owner | Security policies and compliance | @security-team |
| Cost Management | Budget monitoring and optimization | @finance-team |