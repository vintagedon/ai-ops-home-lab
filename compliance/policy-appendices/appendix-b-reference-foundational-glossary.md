# Appendix B: Glossary of Terms

This appendix provides authoritative definitions for key terminology used throughout the NIST AI RMF Cookbook and associated governance documentation. It is divided into two parts:

* Part A: Foundational Glossary of AI Governance, Risk, and Security: This section contains universal terms derived from industry standards, legal frameworks, and established best practices. These definitions are broadly applicable to any organization implementing a robust AI governance program.
* Part B: Organization-Specific Supplement for RadioAstronomy.io: This section provides definitions for terms, policies, and architectural concepts unique to the RadioAstronomy.io organization. It adds specific implementation context to the foundational terms and codifies the organization's unique operational and governance models.

---

## Part A: Foundational Glossary of AI Governance, Risk, and Security

This foundational glossary establishes a common vocabulary for discussing artificial intelligence, risk management, cybersecurity, and compliance. Definitions are aligned with authoritative sources, including the NIST AI Risk Management Framework (AI RMF), CIS® Critical Security Controls (CIS Controls®), ISO 31000:2018, and relevant legislation to ensure compliance-grade precision.

### A

* Access Control List (ACL) | A list of permissions attached to an object, specifying which users or system processes are granted access to objects, as well as what operations are allowed on given objects.
* Access Package | A bundle of all the resources with the access a user needs to work on a project or perform their task. Access packages are used to govern access for internal employees and users outside the organization.
* Accountable and Transparent (AI Trustworthiness Characteristic) | A characteristic of a trustworthy AI system. Transparency refers to the extent to which information about an AI system and its outputs is available to and understandable by individuals. Accountability refers to the mechanisms in place to ensure that AI systems are used responsibly and that their impacts are managed effectively.
* ADR (Architecture Decision Record) | A lightweight document used to record a technically significant decision, including its context and consequences.
* AES-256 | Advanced Encryption Standard with a 256-bit key size. A symmetric encryption algorithm widely used for securing data at rest and in transit.
* Agent (AI) | An autonomous or semi-autonomous system, often powered by one or more AI models, that perceives its environment, reasons about its goals, and acts to achieve those goals.
* AI RMF (NIST AI Risk Management Framework) | A voluntary framework developed by the U.S. National Institute of Standards and Technology (NIST) to help organizations identify, assess, prioritize, and manage risks throughout the artificial intelligence lifecycle, with the goal of promoting trustworthy and responsible AI.
* AI RMF Functions | The four core functions of the NIST AI RMF 1.0 that guide organizations through AI risk management practices. The functions are GOVERN, MAP, MEASURE, and MANAGE.
* AI System | A socio-technical system that includes one or more AI models, along with the necessary data, human oversight, and processes for development, deployment, and maintenance. Colorado SB24-205 defines it as "any machine-based system that, for any explicit or implicit objective, infers from the inputs the system receives how to generate outputs... that can influence physical or virtual environments."
* AIOps | The application of artificial intelligence, machine learning, and data analytics to automate and enhance IT operations, including monitoring, event correlation, and incident response.
* Air Gap | A network security measure implemented by physically isolating a computer or network from other networks, such as the public internet, to prevent unauthorized data egress or ingress.
* Algorithmic Discrimination | A legal definition from Colorado SB24-205. It refers to any condition in which the use of an AI system results in an unlawful differential treatment or impact that disfavors an individual or group of individuals on the basis of actual or perceived membership in a protected class.
* Alignment (AI) | The process and goal of ensuring that an AI model's behavior is consistent with human intent, values, and established safety policies.
* Ansible | An open-source software provisioning, configuration management, and application-deployment tool enabling infrastructure as code. It uses human-readable YAML templates.
* API Gateway | A management tool that sits between a client and a collection of backend services, acting as a reverse proxy to accept all application programming interface (API) calls, aggregate the various services required to fulfill them, and return the appropriate result.
* API Key | A unique identifier or token used to authenticate a user, developer, or calling program to an API. It is used to control access and track usage.
* APRA (Access Pattern Risk Analysis) | A review process that analyzes data access paths, permissions, and potential exposures to identify and mitigate risks of unauthorized data access or leakage.
* ARC-C / ARC-E | Adversarial Reasoning Corpus (Challenge/Easy sets). Benchmarks designed to evaluate the reasoning capabilities of AI models using questions that are difficult for retrieval-based methods to solve.
* Argo CD | A declarative, GitOps continuous delivery tool for Kubernetes.
* Artifact Registry | A managed repository for storing, managing, and securing software packages and build artifacts, such as Docker containers, language packages, and OS packages.
* Asset Inventory | An authoritative and comprehensive list of all enterprise assets connected to the infrastructure, including hardware, software, data, and cloud resources, which must be monitored and protected.
* Assurance Case | A structured argument, supported by a body of evidence, that provides a compelling, comprehensible, and valid case that a system is safe for a given application in a given environment.
* Astropy | A community-developed Python library for astronomy. It serves as the core package for astronomical data analysis, providing common tools and functionality for working with astronomical data and coordinate systems.
* Attestation | A process that provides cryptographic or digitally signed proof of a system's or software's state, identity, or integrity, often used in secure boot and remote system verification.
* Audit Log | A chronological and tamper-evident record of security-relevant events, providing a documentary trail of activities used to detect security violations, verify operational procedures, and support forensic analysis.
* AuthN / AuthZ | Authentication (AuthN) is the process of verifying a user's identity. Authorization (AuthZ) is the process of granting or denying a verified user permission to access specific resources.
* Availability (A of CIA) | A core principle of information security ensuring that systems, applications, and data are accessible and usable upon demand by authorized users.

### B

* Backpressure | A flow control mechanism in data processing systems where a downstream consumer can signal to an upstream producer to slow down or pause data transmission to prevent being overwhelmed.
* Bastion Host | A special-purpose, hardened computer on a network specifically designed and configured to withstand attacks, serving as a secure entry point to an internal network from an external one.
* Benchmark (Model) | A standardized suite of tasks or datasets used to evaluate the performance, capabilities, and limitations of an AI model in a consistent and comparable manner (e.g., MMLU, GSM8K).
* Bias (Model) | A systematic error or prejudice in an AI system that results in unfair or skewed outcomes, often disadvantaging certain individuals or groups based on demographic attributes. Managing harmful bias is a key characteristic of Trustworthy AI.
* Blue/Green Deploy | A deployment strategy in which two identical production environments ("Blue" and "Green") are maintained. New code is deployed to the inactive environment, and traffic is switched over only after successful testing, allowing for instant rollback.
* BOM (SBOM/DBOM) | Bill of Materials. A formal, machine-readable inventory of components. A Software Bill of Materials (SBOM) lists software components, while a Data Bill of Materials (DBOM) lists datasets used to train an AI model, including their provenance and characteristics.
* Branch Protection | A set of rules configured in a version control system (e.g., Git) that enforces certain workflows for one or more branches, such as requiring pull request reviews or passing status checks before code can be merged.
* Bring-Your-Own-Key (BYOK) | A cloud security model that allows customers to use their own encryption keys to encrypt their data in a cloud provider's services, rather than using keys generated and managed by the provider.

### C

* CASB (Cloud Access Security Broker) | A security policy enforcement point positioned between cloud service consumers and cloud service providers to interject enterprise security policies as cloud-based resources are accessed.
* Case Study | A detailed narrative of a real-world incident, implementation, or project, used to analyze its context, challenges, and outcomes to derive lessons learned.
* Change Advisory | A formal process or governing body (Change Advisory Board, CAB) that reviews and approves significant changes to IT infrastructure or services to minimize risk and disruption.
* Checksum | A small-sized block of data derived from another block of digital data for the purpose of detecting errors that may have been introduced during its transmission or storage.
* CI/CD (Continuous Integration/Continuous Delivery) | A software development practice where developers regularly merge their code changes into a central repository (CI), after which automated builds and tests are run. Continuous Delivery (CD) extends this by automatically deploying all code changes to a testing and/or production environment after the build stage.
* CI/CD Runner | An agent or server that executes jobs defined in a CI/CD pipeline, such as compiling code, running tests, and deploying applications.
* CIS Controls v8 | The CIS Critical Security Controls Version 8. A prioritized and prescriptive set of cybersecurity best practices and defensive actions that help organizations protect against the most pervasive cyber threats.
* CIS-RAM (CIS Risk Assessment Method) | A risk assessment methodology developed by the Center for Internet Security (CIS) to help organizations evaluate and justify their implementation of the CIS Controls. It is based on the Duty of Care Risk Analysis (DoCRA) standard and helps align security efforts with an organization's mission and obligations.
* Citizen Science | Scientific research conducted, in whole or in part, by amateur or non-professional scientists, often in collaboration with or under the direction of professional scientists and scientific institutions.
* CLA (Contributor License Agreement) | A legal document in which an individual or entity contributing to an open-source project states that they are entitled to contribute the intellectual property and are granting the project a license to use it.
* Claude | A family of large language models developed by Anthropic, used for a wide range of natural language processing tasks, including analysis, summarization, and conversational AI.
* Cloudflare ZTNA | A Zero Trust Network Access service provided by Cloudflare that enables secure access to internal applications without a traditional VPN, by verifying every request to a resource.
* CMDB (Configuration Management Database) | A repository that acts as a data warehouse, storing information about IT assets (known as configuration items or CIs) and the relationships between them.
* Compensating Control | An alternative security control used when a primary or prescribed control cannot be implemented. It is designed to mitigate the risk associated with the absence of the primary control to an acceptable level.
* Confidentiality (C of CIA) | A core principle of information security that ensures information is not disclosed to unauthorized individuals, entities, or processes.
* Configuration Drift | The phenomenon where the configuration of a production system deviates over time from its intended, baseline state, often leading to security vulnerabilities or operational issues.
* Consequential Decision | A legal definition from Colorado SB24-205. It refers to a decision that has a material legal or similarly significant effect on the provision of, cost of, or terms of access to critical life areas, including education, employment, financial services, healthcare, housing, insurance, or legal services.
* Container | A lightweight, standalone, executable package of software that includes everything needed to run it: code, runtime, system tools, system libraries, and settings. Docker and OCI are common container formats.
* Content Filter | A programmatic guard or policy-enforcing layer for AI systems that screens inputs or outputs to detect and block harmful, inappropriate, or disallowed content.
* Context Window | The maximum number of tokens (words, sub-words, or characters) that an AI model can process as input at one time.
* Control (Security) | A safeguard or countermeasure prescribed for an information system or organization to protect the confidentiality, integrity, and availability of its information and to meet a set of defined security requirements.
* Control Evidence | Artifacts, logs, or documentation that demonstrate a security control has been implemented correctly and is operating effectively.
* Control Owner | The individual or group with the responsibility for the development, implementation, and maintenance of a security control.
* Controller / Processor | Roles defined under GDPR. A "controller" determines the purposes and means of processing personal data, while a "processor" processes personal data on behalf of the controller.
* COU (Conditions of Use) | A set of rules or constraints that specify how a particular model, dataset, or software component may be used, often including restrictions on commercial use, redistribution, or specific applications.
* CPE / CVE / CVSS | Common Platform Enumeration (CPE) is a standardized naming scheme for IT systems and software. Common Vulnerabilities and Exposures (CVE) is a list of publicly disclosed cybersecurity vulnerabilities. Common Vulnerability Scoring System (CVSS) is a standard for assessing the severity of vulnerabilities.
* CWE-LLM | Common Weakness Enumeration for Large Language Models. A community-developed list of common software and hardware weakness types that have security ramifications, specifically adapted for vulnerabilities found in LLMs (e.g., prompt injection).

### D

* Data Catalog | A centralized, indexed inventory of an organization's data assets, providing metadata, data lineage, and governance information to help data users discover and understand data.
* Data Governance | The overall management of the availability, usability, integrity, and security of the data employed in an enterprise. It includes the policies, processes, standards, and roles that ensure data is managed as a strategic asset.
* Data Lineage | The lifecycle of data, including its origins, transformations, and movements over time. It provides a detailed audit trail of where data comes from and how it has changed.
* Data Loss Prevention (DLP) | A set of tools and processes used to ensure that sensitive data is not lost, misused, or accessed by unauthorized users. DLP software classifies and protects business-critical data.
* Data Minimization | A privacy principle that dictates that data collection and retention should be limited to what is strictly necessary to accomplish a specified purpose.
* Data Plane | The part of a network that carries user traffic. It is distinct from the control plane, which carries signaling and routing information.
* Data Protection Impact Assessment (DPIA) | A process required under GDPR to help identify and minimize the data protection risks of a project, particularly for processing that is likely to be high-risk.
* Data Residency | The requirement that certain types of data must be stored and processed in a specific geographic location, often due to legal or regulatory mandates.
* Data Subject | An identified or identifiable natural person to whom personal data relates, as defined under privacy regulations like GDPR.
* Dataset Card | Structured documentation that accompanies a dataset, providing key information about its creation, scope, limitations, intended use, and potential biases.
* Dataset Drift | A phenomenon where the statistical properties of the input data used for model inference change over time compared to the data the model was trained on, potentially degrading model performance.
* Decision Log | A chronological record of key decisions made during a project, often in the form of Architecture Decision Records (ADRs), including the rationale and context for each decision.
* Defense in Depth | A cybersecurity strategy that employs multiple layers of security controls to protect an organization's assets, ensuring that if one layer fails, another is in place to thwart an attack.
* De-Identification | The process of removing or obscuring personally identifiable information from data records to protect individual privacy. This includes techniques like pseudonymization and anonymization.
* Dependency Pinning | The practice of locking the versions of software dependencies in a project to specific, known-good releases to ensure reproducible builds and prevent unexpected issues from upstream updates.
* Deployer | A legal definition from Colorado SB24-205. It refers to a person doing business in Colorado that deploys a High-Risk AI System.
* Deployment Freeze | A designated period, typically during critical business cycles or holidays, during which no changes are deployed to production environments to ensure stability.
* Dev Container | A development environment running inside a container. It provides a consistent and reproducible toolchain for developers, defined in a version-controlled configuration file.
* Developer | A legal definition from Colorado SB24-205. It refers to a person doing business in Colorado that develops or intentionally and substantially modifies an artificial intelligence system.
* DevEx (Developer Experience) | The overall experience developers have while interacting with a toolchain, platform, or set of processes, focusing on reducing friction and increasing productivity.
* Diff | A view that shows the line-by-line differences between two versions of a file or set of files, commonly used in version control systems.
* Drift Detection (IaC) | The process of detecting discrepancies between the state of deployed infrastructure and the state defined in the Infrastructure as Code (IaC) source files.
* DRO (Documented Risk Owner) | The individual formally designated as responsible for the acceptance, mitigation, or transfer of a specific, documented risk.
* ds9 (SAOImage DS9) | An astronomical imaging and data visualization application. It is widely used by astronomers to display and analyze FITS (Flexible Image Transport System) images and data.
* Duties Separation (SoD) | Separation of Duties. An internal control concept that involves separating critical tasks among multiple individuals to reduce the risk of fraud, error, and abuse.

### E

* East-West / North-South Traffic | In a data center context, "East-West" traffic flows between servers within the same data center. "North-South" traffic flows between the data center and a location outside the data center (e.g., the internet).
* eBPF (Extended Berkeley Packet Filter) | A kernel technology that allows for the execution of sandboxed programs in an operating system kernel, enabling programmable networking, observability, and security without changing kernel source code.
* Edge Node | A compute resource located at the edge of a network, closer to data sources or end-users, to reduce latency and improve resilience.
* Effective Date | The date on which a policy, standard, or legal agreement officially comes into force and becomes applicable.
* Enclave | A secure, isolated computing environment with tightly controlled access, designed to protect sensitive data and code even from the host system's administrator.
* Entra ID (Azure AD) | Microsoft's cloud-based identity and access management service, providing single sign-on, multi-factor authentication, and conditional access to protect users and resources.
* EOL / EOS | End-of-Life (EOL) is the date when a product is retired from the market. End-of-Support (EOS) is the date when a vendor will no longer provide technical support, updates, or patches for a product.
* Error Budget | A concept in Site Reliability Engineering (SRE) that defines the acceptable level of unreliability for a service. It allows development teams to balance the pace of innovation with the need for service stability.
* EU AI Act | A landmark European Union regulation that establishes a legal framework for artificial intelligence. It classifies AI systems into risk tiers (unacceptable, high, limited, minimal) and imposes corresponding obligations on providers and users.
* Eval Harness | A software framework used for running standardized evaluations and benchmarks on AI models to assess their performance in a consistent and reproducible manner.
* Event Log | A time-ordered record of events that occur in a system or application, used for debugging, monitoring, and security analysis.
* Exception (Policy) | A formal, documented, and time-bound approval for a deviation from a standard policy or control, typically requiring a risk assessment and justification.
* Explainability and Interpretable (AI Trustworthiness Characteristic) | A characteristic of a trustworthy AI system. Explainability is the ability to provide a meaningful explanation of how an AI system reached a particular output. Interpretability is the ability to understand the underlying mechanics of an AI model's decision-making process.

### F

* FAIR Principles | A set of guiding principles for scientific data management and stewardship designed to make data Findable, Accessible, Interoperable, and Reusable. The principles emphasize machine-actionability to facilitate automated discovery and reuse of data.
* Fair - with Harmful Bias Managed (AI Trustworthiness Characteristic) | A characteristic of a trustworthy AI system. It refers to the system's ability to avoid producing unfair or discriminatory outcomes for different individuals or groups, ensuring equitable treatment and mitigating harmful biases.
* Feature Flag | A software development technique that allows teams to turn certain functionality on and off during runtime without deploying new code, enabling controlled rollouts and A/B testing.
* Few-Shot / Zero-Shot | Prompting techniques for AI models. "Zero-shot" prompting asks the model to perform a task it has not been explicitly trained on, without any examples. "Few-shot" prompting provides a small number of examples within the prompt to guide the model's response.
* FIDO2 / WebAuthn | A set of open standards for secure, passwordless authentication. They use public-key cryptography to provide strong, phishing-resistant authentication using hardware security keys or biometric authenticators.
* Fine-Tuning | The process of taking a pre-trained foundation model and performing additional training on a smaller, task-specific dataset to adapt its capabilities to a particular domain or application.
* Flux | A GitOps operator for Kubernetes that automatically ensures the state of a cluster matches the configuration in a Git repository.
* Fork | A copy of a source code repository. Forking allows a developer to experiment with changes without affecting the original project.

### G

* Gating (Controls) | Automated checks or required approvals within a CI/CD pipeline that block a process from proceeding to the next stage unless specific criteria are met (e.g., passing all tests, security scans, or manual approvals).
* GDPR (General Data Protection Regulation) | A comprehensive data protection and privacy regulation in the European Union that governs the processing of personal data of individuals within the EU.
* Gemini | A family of multimodal large language models developed by Google, used for a wide range of applications including research, code generation, and autonomous agents.
* Git Commit Signature | A cryptographic signature (e.g., using GPG) applied to a Git commit to verify the author's identity and ensure the integrity of the code change.
* GitOps | An operational framework for managing infrastructure and applications where Git is the single source of truth. Infrastructure is defined declaratively as code in a Git repository, and an automated process ensures the live environment matches the state defined in the repository.
* Gitleaks / Secret Scanning | Tools and processes that automatically scan source code repositories for accidentally committed secrets, such as API keys, passwords, and private keys.
* Golden Path | A curated, well-supported, and recommended workflow or toolchain that guides developers toward best practices for a specific task, such as building and deploying a new service.
* GOVERN (AI RMF Function) | A core, cross-cutting function of the NIST AI RMF. It focuses on cultivating a risk management culture, establishing organizational risk policies and priorities, and ensuring that AI risk management is integrated into the broader enterprise risk management portfolio.
* Grafana | An open-source analytics and interactive visualization web application that provides charts, graphs, and alerts for time-series data from various data sources like Prometheus and Loki.
* Grounding | The technique of anchoring an AI model's generated output in verifiable, authoritative information retrieved from an external knowledge source, often used in Retrieval-Augmented Generation (RAG) to reduce hallucinations.
* Guardrails | Programmatic constraints, rules, or policies implemented within an AI system to ensure its behavior remains within safe, secure, and compliant boundaries, preventing harmful or unintended actions.

### H

* Hallucination | A phenomenon where an AI model generates confident but factually incorrect or nonsensical information that is not grounded in its training data or provided context.
* Harm Taxonomy | A structured classification of the potential harms that can arise from AI systems, categorized by type (e.g., physical, psychological, social) and severity, used to guide risk assessment.
* HashiCorp Vault | A tool for securely storing and controlling access to secrets, such as API keys, passwords, and certificates. It provides a centralized secret management solution with features like dynamic secrets and encryption as a service.
* Helm | A package manager for Kubernetes that simplifies the process of defining, installing, and upgrading complex Kubernetes applications using pre-configured packages called "charts."
* High-Risk AI System | A legal definition from Colorado SB24-205. It refers to an AI system that makes, or is a substantial factor in making, a Consequential Decision. The definition includes a list of specific exclusions for systems that do not meet this criterion.
* Honeypot | A decoy computer system set up to attract and trap cyberattackers, allowing security personnel to observe their activities and gather intelligence on their methods without exposing real production systems.
* Hotfix | An urgent software patch applied to a live production environment outside of the normal release cadence to address a critical bug or security vulnerability.
* Human-in-the-Loop (HITL) | A model of interaction where a human is required to review, validate, or approve a decision or action proposed by an AI system, especially for high-stakes or sensitive tasks.
* Human Oversight | The capability for humans to oversee, monitor, and intervene in the operation of an AI system. This is a critical component for ensuring accountability and safety, particularly for autonomous systems.

### I

* IAST/DAST/SAST | Application security testing methods. Static Application Security Testing (SAST) analyzes source code for vulnerabilities. Dynamic Application Security Testing (DAST) tests a running application for vulnerabilities. Interactive Application Security Testing (IAST) combines elements of both by instrumenting the running application.
* IaC (Infrastructure as Code) | The practice of managing and provisioning computer data centers through machine-readable definition files, rather than physical hardware configuration or interactive configuration tools. Terraform and Ansible are common IaC tools.
* Impact (Risk) | The magnitude of harm or loss that could result if a specific risk materializes. It is a key component of risk analysis, along with likelihood.
* Implementation Group (IG) | The maturity tiers within the CIS Controls (IG1, IG2, IG3) that provide a prioritized path for implementation. Organizations can select an IG based on their risk profile and available resources, allowing for a tailored approach to cybersecurity.
* IG1 (Implementation Group 1) | The first maturity tier of the CIS Controls, defined as "essential cyber hygiene." It consists of a foundational set of 56 Safeguards that every enterprise should implement to defend against the most common and pervasive cyberattacks.
* Incident | A confirmed adverse event that negatively affects the confidentiality, integrity, or availability of an organization's information assets.
* Indicator of Attack/Compromise (IoA/IoC) | IoAs are signals that an attack is in progress, focusing on the adversary's actions. IoCs are artifacts or evidence observed on a network or in an operating system that indicate a computer intrusion has occurred.
* Inference (AI) | The process of using a trained AI model to make predictions or generate outputs based on new, previously unseen input data.
* Ingress / Egress | In networking, "ingress" refers to traffic entering a network boundary, while "egress" refers to traffic leaving it. These are critical points for applying security policies.
* Inherent Risk | The level of risk that exists in an environment before the implementation of any security controls or mitigation strategies. It represents the "raw" risk associated with a particular activity or asset.
* Integrity (I of CIA) | A core principle of information security that ensures the accuracy, completeness, and trustworthiness of data, protecting it from unauthorized modification or destruction.
* IRAF (Image Reduction and Analysis Facility) | A collection of software developed at the National Optical Astronomy Observatory (NOAO) for the reduction and analysis of astronomical images and spectra. Though considered legacy software, it remains in use for certain data processing tasks.
* ISO/IEC 27001 | An international standard for information security management. It specifies the requirements for establishing, implementing, maintaining, and continually improving an Information Security Management System (ISMS).
* ISO/IEC 42001 | An international standard that specifies the requirements for establishing, implementing, maintaining, and continually improving an Artificial Intelligence Management System (AIMS) within an organization.
* ISO 31000:2018 | An international standard that provides principles, a framework, and a process for managing risk. It defines risk as "the effect of uncertainty on objectives" and is applicable to any organization, regardless of size or sector.

### J

* JIT Access (Just-in-Time) | A security practice where privileged access to resources is granted to users only for a limited time, on an as-needed basis, and is automatically revoked after the session expires.

### K

* K8s (Kubernetes) | An open-source container orchestration platform for automating the deployment, scaling, and management of containerized applications.
* KEDA (Kubernetes Event-Driven Autoscaling) | A component that provides event-driven autoscaling for Kubernetes workloads, allowing applications to scale based on the number of events needing to be processed.
* Key Rotation | The security practice of periodically changing cryptographic keys to limit the amount of data compromised if a key is exposed.
* KMS (Key Management Service) | A managed service that simplifies the creation, storage, management, and auditing of cryptographic keys used to encrypt data.
* KSM (Kubernetes Secrets Manager) | A pattern or tool for managing secrets in Kubernetes by syncing them from an external secret management system (like HashiCorp Vault or AWS Secrets Manager) into native Kubernetes Secrets.
* KVM (Kernel-based Virtual Machine) | A virtualization module in the Linux kernel that allows the kernel to function as a hypervisor, enabling it to run multiple, isolated virtual machines.

### L

* L3/L4/L7 | Layers of the OSI model. Layer 3 (Network) deals with IP addressing and routing. Layer 4 (Transport) deals with TCP/UDP ports and sessions. Layer 7 (Application) deals with application-level protocols like HTTP.
* Latency SLO | A Service Level Objective (SLO) that defines a target for the response time of a service, typically measured in percentiles (e.g., 95% of requests should be served in under 200ms).
* Layer-3 Switch | A network switch that can perform routing functions at the IP (Layer 3) level, in addition to the standard MAC address (Layer 2) switching.
* Layer-7 WAF | An application-layer Web Application Firewall that inspects HTTP/S traffic to detect and block common web-based attacks like SQL injection and cross-site scripting.
* Least Privilege | The security principle of granting users, applications, or systems only the minimum levels of access or permissions necessary to perform their required functions.
* Liveness/Readiness Probe | Health checks in Kubernetes. A "liveness probe" determines if a container needs to be restarted. A "readiness probe" determines if a container is ready to start accepting traffic.
* LLM (Large Language Model) | A type of foundation model trained on vast amounts of text data to understand and generate human-like language.
* Local RAG | Retrieval-Augmented Generation where the retrieval index is limited to on-premises or private data sources, ensuring that sensitive information does not leave the organization's control.
* Loki | A horizontally scalable, highly available, multi-tenant log aggregation system by Grafana Labs, designed to be cost-effective and easy to operate.

### M

* MANAGE (AI RMF Function) | A core function of the NIST AI RMF. It focuses on allocating resources to treat identified AI risks, monitoring the effectiveness of those treatments, and managing risks on an ongoing basis. It involves prioritizing and implementing risk responses.
* MAP (AI RMF Function) | A core function of the NIST AI RMF. It involves establishing the context for risk management, categorizing AI systems, and identifying potential risks and impacts to individuals, organizations, and society.
* Markdownlint | A linter for Markdown files that checks for style and syntax issues, helping to ensure consistency and readability in documentation.
* MEASURE (AI RMF Function) | A core function of the NIST AI RMF. It involves using qualitative and quantitative tools, techniques, and methodologies to analyze, assess, and track identified AI risks and their impacts.
* MFA (Multi-Factor Authentication) | An authentication method that requires the user to provide two or more verification factors to gain access to a resource, such as something you know (password), something you have (security key), and something you are (biometric).
* MLOps (Machine Learning Operations) | A set of practices that aims to deploy and maintain machine learning models in production reliably and efficiently. It combines ML, DevOps, and Data Engineering.
* MMLU / GSM8K / GPQA | Academic benchmarks for evaluating large language models. MMLU (Massive Multitask Language Understanding) tests broad knowledge. GSM8K (Grade School Math) tests multi-step mathematical reasoning. GPQA (Graduate-Level Google-Proof Q&A) tests expert-level knowledge.
* Model Card | Standardized documentation for an AI model that provides key information about its intended use, performance characteristics, limitations, ethical considerations, and evaluation data.
* Model Drift | The degradation of a model's predictive performance over time, often caused by changes in the underlying data distribution or relationships between variables.
* Monitoring | The continuous collection, analysis, and use of metrics, logs, and traces to observe the health, performance, and security of a system.
* MTTR / MTTD | Mean Time to Resolve (MTTR) is the average time taken to resolve an incident. Mean Time to Detect (MTTD) is the average time taken to discover an incident.

### N

* NAC (Network Access Control) | A security approach that attempts to unify endpoint security technology, user or system authentication, and network security enforcement.
* NAT (Network Address Translation) | A method of remapping an IP address space into another by modifying network address information in the IP header of packets while they are in transit across a traffic routing device.
* NDA (Non-Disclosure Agreement) | A legal contract between at least two parties that outlines confidential material, knowledge, or information that the parties wish to share with one another for certain purposes, but wish to restrict access to.
* NEN (Near-Miss) | An unplanned event that did not result in injury, illness, or damage – but had the potential to do so. Also known as a "close call."
* N8N | A free and open-source workflow automation tool that allows for the creation of complex workflows by connecting different applications and services through nodes.
* NIST SP 800-53 | A publication by the National Institute of Standards and Technology that provides a catalog of security and privacy controls for all U.S. federal information systems except those related to national security.

### O

* Observability (AI) | The practice of collecting and analyzing telemetry data (prompts, outputs, latency, costs, tool calls) from AI systems to understand their behavior, debug issues, and monitor for risks.
* Observability | The ability to measure the internal states of a system by examining its external outputs (logs, metrics, and traces). It allows teams to ask arbitrary questions about their system's behavior without having to pre-define what to monitor.
* OIDC / SAML | OpenID Connect (OIDC) and Security Assertion Markup Language (SAML) are open standards for identity federation, enabling single sign-on (SSO) between different identity providers and service providers.
* On-Call | A rotating duty roster where specific individuals are responsible for responding to system alerts and incidents outside of normal working hours.
* OPA / Gatekeeper | Open Policy Agent (OPA) is an open-source, general-purpose policy engine. Gatekeeper is a Kubernetes-native project that integrates OPA to enforce policies on a Kubernetes cluster.
* OPA Rego | The declarative policy language used by the Open Policy Agent (OPA) to express policies over complex hierarchical data structures.
* OPA-based Guardrails | Policies written in Rego and enforced by OPA to act as safety constraints or Guardrails for AI agents, preventing them from performing unsafe actions or generating disallowed outputs.
* Open Weight / Closed Weight | Refers to the availability of an AI model's parameters ("weights"). "Open weight" models have their weights publicly released, allowing anyone to download and run them. "Closed weight" models are accessible only through a proprietary API.
* OpenTelemetry | An open-source observability framework providing a standardized set of APIs, libraries, agents, and instrumentation to collect and export telemetry data (metrics, logs, and traces).
* Operational Risk | The risk of loss resulting from inadequate or failed internal processes, people, and systems, or from external events.
* Ops Runbook | A detailed, step-by-step procedure for handling a specific operational task or responding to a particular scenario, such as a system outage or a security alert.
* Overlay Network | A virtual network that is built on top of an existing physical network (the underlay). Technologies like VXLAN create overlay networks.

### P

* P0/P1/P2 | Priority levels used to classify the severity and urgency of incidents or issues. P0 is the highest priority (critical emergency), followed by P1 (high), P2 (medium), and so on.
* Patching Window | A scheduled and pre-approved timeframe during which system updates, security patches, and other maintenance activities can be performed to minimize disruption to services.
* PBAC / ABAC / RBAC | Access control models. Role-Based Access Control (RBAC) grants access based on user roles. Attribute-Based Access Control (ABAC) uses policies that combine attributes of users, resources, and the environment. Policy-Based Access Control (PBAC) is a broader term encompassing ABAC and other dynamic models.
* Pen Test (Penetration Test) | An authorized, simulated cyberattack on a computer system, performed to evaluate the security of the system by actively exploiting vulnerabilities.
* PIA (Privacy Impact Assessment) | A process used to identify and assess the potential privacy risks and impacts of a new or substantially changed project, system, or policy.
* PII (Personally Identifiable Information) | Any information that can be used to identify a specific individual, either on its own or when combined with other information.
* Pipeline (CI/CD) | An automated workflow that defines the stages a code change goes through from the version control repository to deployment in a production environment.
* Playbook (IR) | A set of predefined, step-by-step actions to be executed in response to a specific type of security incident, ensuring a consistent and effective response.
* Pod Security Standards | Kubernetes-defined policies (Privileged, Baseline, Restricted) that set different isolation levels for pods, constraining their security context and capabilities.
* Policy as Code | The practice of managing and automating policies (for security, compliance, or operations) by defining them in a high-level, declarative language that can be version-controlled, tested, and applied automatically.
* Policy Exception Register | A formal log or database that tracks all approved deviations (Exceptions) from standard security policies, including their justification, scope, duration, and associated risks.
* Portainer | A lightweight management UI that allows for easy management of Docker, Kubernetes, and other containerized environments.
* Posture Management (CSPM/KSPM) | Cloud/Kubernetes Security Posture Management. The continuous process of cloud security improvement and adaptation to reduce the likelihood of a successful attack, often through automated detection of misconfigurations.
* Pre-Commit | A framework for managing and maintaining multi-language pre-commit hooks, which are scripts that run automatically before a commit is created to check for issues like formatting, linting, and syntax errors.
* Privacy by Design | An approach to systems engineering that seeks to embed privacy and data protection considerations into the design and architecture of IT systems and business practices from the outset.
* Privacy-Enhanced (AI Trustworthiness Characteristic) | A characteristic of a trustworthy AI system. It refers to the incorporation of privacy-enhancing technologies and principles throughout the data lifecycle to protect individual privacy and confidentiality.
* Prometheus | An open-source systems monitoring and alerting toolkit that collects and stores its metrics as time-series data, with a powerful query language (PromQL).
* Prompt Injection | A type of attack against large language models where an attacker embeds malicious instructions into a prompt to subvert the model's intended behavior and bypass its safety controls.
* Prompt Template | A pre-defined, reusable text structure for prompts that includes placeholders for variables. It helps ensure consistency and structure in interactions with an AI model.
* Proxmox VE (Virtual Environment) | An open-source server virtualization management platform. It integrates KVM for virtual machines and LXC for containers, storage, and networking on a single platform, managed through a web-based interface.
* Proxy (Forward/Reverse) | A forward proxy acts on behalf of a client, forwarding its requests to other servers. A reverse proxy acts on behalf of a server, intercepting requests from clients and forwarding them to the appropriate backend server.
* PSIRT (Product Security Incident Response Team) | A team or process within an organization responsible for responding to security vulnerabilities discovered in its products or services.

### Q

* QSO Catalog | An astronomical catalog that lists quasars (quasi-stellar objects), which are extremely luminous active galactic nuclei.

### R

* RACI | A responsibility assignment matrix that maps out who is Responsible, Accountable, Consulted, and Informed for the tasks and decisions in a project or business process.
* RAG (Retrieval-Augmented Generation) | An AI technique that enhances the output of a large language model by grounding it in information retrieved from an external, authoritative knowledge source. This helps to reduce hallucinations and provide more accurate, up-to-date responses.
* Rancher RKE2 | A fully conformant, hardened Kubernetes distribution that is focused on security and compliance within the U.S. Federal Government sector.
* Rate Limiting | A control mechanism used to limit the number of requests a user or client can make to a server or API within a specified time period, preventing abuse and ensuring service availability.
* RBAC (K8s) | Role-Based Access Control in Kubernetes. An authorization mechanism that restricts access to cluster resources based on the roles of individual users within a namespace or across the entire cluster.
* Red Teaming (AI) | A form of adversarial testing where a dedicated team simulates attacks against an AI system to proactively discover its vulnerabilities, weaknesses, and unsafe capabilities before they can be exploited maliciously.
* Residual Risk | The level of risk that remains after security controls and other mitigation measures have been implemented. It is the risk that an organization has decided to tolerate or accept.
* Retrieval Index | A searchable data structure, often a vector database or text index, that stores information in a way that allows for efficient retrieval of relevant documents or data chunks for use in a RAG system.
* Risk | The effect of uncertainty on objectives. This definition, from ISO 31000:2018, encompasses both the potential for negative impacts (threats) and the uncertainty in achieving positive outcomes (opportunities).
* Risk Acceptance | A formal decision to tolerate a known risk without implementing additional controls, typically because the risk is within the organization's defined risk appetite or the cost of mitigation outweighs the potential impact.
* Risk Appetite | The amount and type of risk that an organization is willing to pursue or retain in the pursuit of its objectives.
* Risk Management | Coordinated activities to direct and control an organization with regard to risk. It involves the systematic application of principles, a framework, and a process for identifying, analyzing, evaluating, treating, and monitoring risk.
* Risk Owner | The person or entity with the accountability and authority to manage a particular risk.
* Rollback | The process of reverting a system or application to a previous, known-good state, typically after a failed deployment or the discovery of a critical issue.
* RTO / RPO | Recovery Time Objective (RTO) is the maximum acceptable downtime for a system after an incident. Recovery Point Objective (RPO) is the maximum acceptable amount of data loss, measured in time.
* Runbook Automation | The process of converting manual operational procedures (Ops Runbooks) into automated, machine-executable workflows to improve speed, consistency, and reliability.

### S

* S3-Compatible Storage | An object storage service that uses the Amazon S3 (Simple Storage Service) API, allowing tools and applications built for S3 to work with it seamlessly.
* Safe (AI Trustworthiness Characteristic) | A characteristic of a trustworthy AI system. It refers to the system's ability to operate without causing unacceptable harm to people, property, or the environment.
* Safeguard (CIS) | The term used in the CIS Controls for a specific, measurable, and actionable security control implementation. The CIS Controls are composed of 18 Controls and 153 Safeguards.
* Safety Policy | A set of rules and constraints governing the allowed and blocked behaviors of an AI model to prevent it from generating harmful, unsafe, or inappropriate content.
* SAST / DAST | Static Application Security Testing (SAST) analyzes an application's source code, bytecode, or binary code for security vulnerabilities without executing it. Dynamic Application Security Testing (DAST) tests a running application for vulnerabilities by simulating external attacks.
* SBOM (Software Bill of Materials) | A formal, machine-readable inventory of the software components and dependencies included in an application, including their versions and license information.
* Scoping (Assessment) | The process of defining the boundaries of a security assessment or audit, specifying which systems, assets, data, and processes are in-scope and which are out-of-scope.
* Secret | Any piece of sensitive information, such as a password, API key, token, or private key, that should be protected from unauthorized access at rest and in transit.
* Secret Rotation | The security practice of periodically regenerating secrets (like passwords and API keys) and securely updating all systems that use them to limit the window of opportunity for an attacker if a secret is compromised.
* Secure and Resilient (AI Trustworthiness Characteristic) | A characteristic of a trustworthy AI system. "Secure" means the system is protected from unauthorized access, use, disclosure, disruption, modification, or destruction. "Resilient" means the system can withstand and recover from adverse events and disruptions.
* Secure Defaults | The practice of configuring a system or application with the most conservative and safe settings by default, requiring an administrator to explicitly loosen restrictions.
* Secure Enclave (Infra) | An isolated, monitored, and tightly controlled network segment designed to host sensitive workloads and data, with strict ingress and egress filtering.
* Secure SDLC | Secure Software Development Lifecycle. A methodology that embeds security practices and activities, such as threat modeling, code analysis, and security testing, into every phase of the software development process.
* Semantic Versioning | A formal versioning scheme for software, typically in the format MAJOR.MINOR.PATCH, where MAJOR version changes indicate incompatible API changes, MINOR indicates new functionality in a backward-compatible manner, and PATCH indicates backward-compatible bug fixes.
* Service Account | A non-human identity used by an application, script, or service to authenticate and access resources programmatically, without the need for a human user's credentials.
* Service Catalog | A curated and discoverable list of IT services offered by an organization, providing details such as service descriptions, owners, SLAs, and how to request them.
* Service Mesh | An infrastructure layer that handles service-to-service communication in a microservices architecture. It provides features like traffic management, security, and observability through a sidecar proxy deployed alongside each service.
* ServiceAccount Token | A JSON Web Token (JWT) used by pods in Kubernetes to authenticate with the Kubernetes API server, allowing them to interact with cluster resources.
* Severity | A qualitative or quantitative measure of the impact of an issue, vulnerability, or incident.
* Shift Left | A practice in software development where testing, quality, and security are moved to earlier stages in the lifecycle (i.e., "left" on a project timeline diagram) to find and fix issues sooner and more cheaply.
* Sidecar | A design pattern where a secondary container is deployed alongside a primary application container in the same pod, providing auxiliary capabilities like logging, monitoring, or acting as a proxy.
* SIG (Special Interest Group) | A community within a larger organization or project that is organized around a shared interest in a specific topic or area of technology, collaborating to advance knowledge and best practices.
* SLA / SLO / SLI | Service Level Agreement (SLA) is a contract defining the level of service a customer can expect. Service Level Objective (SLO) is a specific, measurable target for reliability within an SLA. Service Level Indicator (SLI) is the actual measurement of a service's performance (e.g., latency, uptime).
* SOAR (Security Orchestration, Automation, and Response) | A set of technologies that enables organizations to collect security data and alerts from various sources, automate incident response actions, and orchestrate workflows between different security tools.
* SOC 2 (Service Organization Control 2) | An auditing procedure that ensures service providers securely manage data to protect the interests of their clients and the privacy of their customers. It is based on the Trust Services Criteria: security, availability, processing integrity, confidentiality, and privacy.
* Soft Delete | A data protection feature where deleted items are marked as inactive and retained for a specified period before being permanently erased, allowing for recovery from accidental deletion.
* Software Supply Chain Security | The practice of securing the entire lifecycle of software development, from code creation and third-party dependencies to the build process and artifact distribution, to protect against tampering and compromise.
* SP (Special Publication) | A document series from the National Institute of Standards and Technology (NIST) that provides guidelines, recommendations, and reference materials on a wide range of technology and security topics (e.g., NIST SP 800-53).
* SPIFFE / SPIRE | The Secure Production Identity Framework for Everyone (SPIFFE) is a set of open standards for securely identifying software services. The SPIFFE Runtime Environment (SPIRE) is an open-source implementation of those standards.
* SSO (Single Sign-On) | An authentication scheme that allows a user to log in with a single set of credentials to multiple independent software systems.
* Static IP | A fixed, unchanging IP address that is manually assigned to a device, as opposed to a dynamic IP address which is assigned by a DHCP server and can change over time.
* Synthetic Test | A monitoring technique that simulates user actions or API calls to proactively test the availability and performance of an application's critical user journeys.
* System Prompt | A set of initial instructions, often hidden from the end-user, that defines an AI assistant's persona, capabilities, constraints, and overall behavior.

### T

* Tabletop Exercise | A discussion-based session where team members meet to discuss their roles and responses during a simulated emergency or incident scenario, used to validate response plans without a full-scale drill.
* Tamper Evidence | A mechanism, such as a cryptographic hash or a digital signature, that can be used to detect whether data or a system has been altered in an unauthorized manner.
* TARA / Threat Modeling | Threat Analysis and Risk Assessment. A structured process for identifying potential threats to a system, evaluating their potential impact, and defining mitigations to reduce risk.
* Temperature / Top-p | Sampling parameters used during AI model inference to control the randomness of the output. "Temperature" adjusts the probability distribution of tokens, with higher values leading to more randomness. "Top-p" (nucleus sampling) selects from the smallest set of tokens whose cumulative probability exceeds a certain threshold.
* Tenant | A logical isolation unit for a customer, team, or application within a shared, multi-tenant platform, ensuring that each tenant's data and configuration are kept separate.
* Terraform | An open-source infrastructure as code (IaC) tool by HashiCorp that allows users to define and provision data center infrastructure using a declarative configuration language.
* Threat | Any potential cause of an unwanted incident, which may result in harm to a system or organization.
* Throughput | The amount of work, such as transactions or data, that a system can process in a given amount of time.
* Ticket (Change/Incident) | A tracked record in an IT Service Management (ITSM) system that documents a specific change request, incident, or service request throughout its lifecycle.
* TimescaleDB | An open-source time-series database built as an extension on PostgreSQL, optimized for fast ingest and complex queries on time-series data.
* Tool Use (Functions) | The capability of an AI model to call external tools, APIs, or functions to retrieve information, perform actions, or delegate tasks, thereby extending its capabilities beyond its internal knowledge.
* Trace (AI) | A detailed record of an AI interaction, including the initial prompt, any intermediate steps (like tool calls), the final response, and associated metadata, used for auditing, debugging, and analysis.
* Triage | The process of initially assessing and prioritizing incoming issues, alerts, or incidents to determine their severity and the appropriate response.
* Trust Boundary | An interface or perimeter where the level of trust changes. Data or requests crossing a trust boundary must be validated and authenticated.
* Trustworthy AI | A term defined by the NIST AI RMF to describe AI systems that are valid and reliable, safe, secure and resilient, accountable and transparent, explainable and interpretable, privacy-enhanced, and fair with harmful bias managed. It is the end goal of a comprehensive AI risk management program.
* TTPs (Tactics, Techniques, and Procedures) | A framework for analyzing and describing the behavior of malicious actors. "Tactics" are the high-level goals, "Techniques" are the methods used to achieve those goals, and "Procedures" are the specific implementations of those techniques.
* Two-Person Rule | A security control that requires the presence and approval of two authorized individuals to perform a particularly sensitive or critical operation.

### U

* UAT (User Acceptance Testing) | The final phase of the software testing process where actual users test the software to see if it is able to carry out the required tasks it was designed for in real-world scenarios.
* Underlay | The physical network infrastructure, including switches, routers, and cabling, that provides the foundation upon which a virtual Overlay Network is built.
* Uptime | The percentage of time that a service or system is operational and available for use.
* User Journey | The end-to-end path a user takes to accomplish a goal while interacting with a product or service, often mapped out to identify pain points and opportunities for improvement.

### V

* Valid and Reliable (AI Trustworthiness Characteristic) | A characteristic of a trustworthy AI system. "Validation" ensures the system meets its intended purpose. "Reliability" ensures the system performs consistently and without failure over time and under various conditions. This is considered the foundational characteristic of trustworthiness.
* Value-Added Catalogs (VACs) | In astronomy, these are enhanced datasets or catalogs that are derived from base survey data. They add value by including derived parameters (like stellar ages or masses), cross-matches with other surveys, or additional context not present in the original data.
* VLAN (Virtual LAN) | A logical grouping of devices on one or more physical LANs that are configured to communicate as if they were attached to the same wire, while being in different physical locations. VLANs are used to segment networks.
* VLAN Hopping | An attack method that allows an attacker on one VLAN to gain unauthorized access to traffic on other VLANs that would normally not be accessible.
* VPC / VNet | Virtual Private Cloud (in AWS) or Virtual Network (in Azure). A logically isolated section of a public cloud where an organization can launch resources in a virtual network that they define.
* Vulnerability | A weakness in a system, process, or control that could be exploited by a threat to cause harm.
* VXLAN (Virtual Extensible LAN) | A network virtualization technology that attempts to address the scalability problems associated with large cloud computing deployments. It uses a VLAN-like encapsulation technique to create an Overlay Network on top of an existing Layer 3 infrastructure.

### W

* WAF (Web Application Firewall) | A firewall that monitors, filters, or blocks HTTP traffic to and from a web application. It is designed to protect against web-specific attacks that network firewalls may not detect.
* Wazuh | An open-source security platform that provides unified SIEM (Security Information and Event Management) and XDR (Extended Detection and Response) capabilities for threat detection, integrity monitoring, incident response, and compliance.
* WCAG (Web Content Accessibility Guidelines) | A set of international standards and guidelines for making web content more accessible to people with disabilities.
* Webhooks | An automated mechanism where a server sends real-time data to other applications as soon as an event occurs. It is an HTTP-based callback function.

### Y

* YubiKey | A brand of hardware security key that provides strong two-factor, multi-factor, and passwordless authentication using standards like FIDO2/WebAuthn.

### Z

* Zenodo | An open-access research data repository operated by CERN. It allows researchers to deposit and share research outputs, including datasets, publications, and software, and assigns a persistent Digital Object Identifier (DOI) to each upload for citability.
* Zero Trust | A security model based on the principle of "never trust, always verify." It requires that all users and devices, whether inside or outside the organization's network, be authenticated, authorized, and continuously validated before being granted access to applications and data.
* ZTNA (Zero-Trust Network Access) | A category of technologies that provides secure remote access to applications and services based on defined access control policies. ZTNA solutions are considered more secure alternatives to traditional VPNs.

---

## Part B: Organization-Specific Supplement for RadioAstronomy.io

This supplement provides definitions for terminology, policies, architectural concepts, and operational protocols that are specific to the RadioAstronomy.io organization. All terms defined herein are marked with "``" and should be interpreted within the context of the foundational terms defined in Part A.

### 1. Organizational Identity and Infrastructure

* AI-Native Organization | `` An organizational model where AI assistance and automation are deeply embedded throughout all operational workflows, not merely as ancillary tools but as integral members of the workforce. AI agents are treated as operational personnel with defined roles, responsibilities, and performance metrics.
* Citizen Science | `` The operational model of RadioAstronomy.io. As a citizen science organization, it conducts scientific research through the contributions of its non-professional scientist members, often in collaboration with or under the direction of professional scientific institutions, to contribute to the field of astronomy.
* Compute Time Donation | `` The philanthropic practice of providing free, scheduled access to the Proxmox Astronomy Cluster for astronomy students worldwide. This is done to support thesis research, dissertation work, and other academic publications, fulfilling a core part of the organization's mission.
* Enhanced Datasets | `` A general term for datasets that have been enriched with additional features, embeddings, or derived parameters beyond the original source data. An example is a public Steam dataset augmented with 1024-dimensional embeddings for reviews, tiles, and metadata, which were materialized from academic research to facilitate novel analyses.
* Proxmox Astronomy Cluster | `` The organization's primary production infrastructure. It is a virtualization cluster based on Proxmox VE that hosts virtual machines and containers for astronomy research compute, data processing pipelines, and the organization's multi-agent AI architecture.
* RadioAstronomy.io | `` A six-person citizen science organization dedicated to astronomical research. Its core activities include operating the Proxmox Astronomy Cluster, publishing astronomical datasets to Zenodo, contributing Value-Added Catalogs (VACs) to the research community, maintaining open-source astronomy tools on GitHub, and executing its Compute Time Donation program.
* Value-Added Catalogs (VACs) | `` A primary research output of the organization. These are enhanced astronomical datasets that add derived parameters, cross-matches with other surveys, or additional context to base survey data, making them more useful for the scientific community.

### 2. The Multi-Agent AI Architecture

The RadioAstronomy.io multi-agent architecture is a novel operational paradigm designed for secure, auditable, and parallelized AI-driven work. This architectural pattern enforces a Zero Trust security model for non-human personnel, where each agent's capabilities are strictly constrained and all inter-agent communication is explicit and observable. This design provides a foundational security control against risks such as RO3 - Prompt Injection & Tool Abuse by ensuring that a compromised agent has a minimal blast radius, confined entirely to its pre-defined scope.

* Autonomous Authority | `` The permission granted to AI agents to execute operations within their defined Bounded Latent Space without requiring human approval for each action. Agents are expected to operate confidently within their scope and use the Escalation pattern via Staging only when blocked, uncertain of a boundary, or encountering a cross-project dependency.
* Bounded Latent Space | `` The core architectural primitive for agent isolation. It is a domain of knowledge, execution authority, and context with explicitly defined boundaries. Each AI agent operates within a unique bounded latent space; for example, the Vault Orchestrator is confined to the vault-wide scope, while each Project Manager is confined to the scope of a single code repository.
* Door 1 / Door 2 | `` Terminology for patterns of access to agent-managed work. "Door 1" refers to direct access to a bounded space by interacting with the agent responsible for it (e.g., asking a Project Manager about its specific repository). "Door 2" refers to synthesized access through an adjacent space, typically by querying the Vault Orchestrator for a cross-project view compiled from multiple Staging notifications.
* Operations Automation | `` An AI agent role, implemented using the Gemini CLI. This agent is responsible for bulk automation tasks, scheduled operations (e.g., cron jobs), and generating operational reports. It operates with a Service Account and has authority primarily over infrastructure and data pipeline execution.
* Parallel Bounded Agents | `` The architectural pattern where multiple AI agents operate simultaneously, each within its own Bounded Latent Space and with different scopes and authorities. Coordination is achieved through shared visibility on the Substrate and notifications in Staging, rather than through hierarchical management or direct agent-to-agent communication.
* Project Manager (PM) | `` An AI agent role, implemented as a Claude Projects instance. Each PM is responsible for the management of an individual code repository, including domain documentation, code generation, and task execution within the repository's defined bounds.
* Staging (as Message Bus) | `` A specific location within the Substrate ({vault}/staging/) that functions as a coordination-through-visibility message bus. Agents write status updates, work summaries, and contextual information to this location as Work Session Notifications. Other agents read from this location to maintain cross-project awareness without requiring direct communication or approval workflows.
* Substrate | `` The shared filesystem that connects all Bounded Latent Spaces, serving as the single source of truth for all agents. In the RadioAstronomy.io architecture, this is implemented as an Obsidian vault synchronized across all relevant machines (desktop → FSO2 → agents01) using Obsidian Sync.
* Vault Orchestrator | `` An AI agent role, implemented as a Claude Projects instance. This agent has the broadest scope, responsible for maintaining the central knowledge system, synthesizing information across all projects by monitoring Staging, executing infrastructure-level tasks, and maintaining the vault's architecture.

### 3. Governance, Policy, and Data Handling

* AI Review Board (ARB) | `` A six-person governance body providing multi-stakeholder oversight for all AI systems. It is composed of the CTO (chair), Security Lead, Operations Lead, a Senior Engineering Representative, a Research Domain Expert, and an External Advisor. The ARB meets quarterly to review the AI Tool Register, risk scenarios, incidents, and the organization's overall Compliance Posture.
* AI Risk Officer (ARO) | `` The role with the authority to formally accept Residual Risk on behalf of the organization. At RadioAstronomy.io, this function is collectively performed by the AI Review Board (ARB).
* AI Tool Register | `` The authoritative, centralized inventory of all approved AI tools and models. The register documents each tool's configuration, data handling practices (including Training Opt-Out status), approved use cases, and access controls. It is maintained by the CTO and reviewed quarterly by the AI Review Board.
* Data Classification Tiers | `` The organization's four-tier system for classifying data based on sensitivity, which dictates the permissible level of interaction with AI systems. This is a core component of the Role-Based AI Stack.

| Tier | Definition | AI Usage Policy |
| :--- | :--- | :--- |
| Secrets | Credentials, API keys, tokens, Personally Identifiable Information (PII). | Never permitted for use with any AI system, internal or external. |
| Protected | Draft research, proprietary algorithms, student data, internal strategy documents. | Permitted for use only with local, air-gapped models (e.g., Llama-3 on an A4000 GPU) where data egress is architecturally impossible. |
| Public-Internal | Internal source code, project documentation, and already-published research papers. | Permitted for use with approved cloud AI services that have a contractual Training Opt-Out (e.g., Gemini via Google Workspace, Claude via CTO workspace). |
| Public-External | Forked open-source software, contributions to community projects, public datasets. | Permissive use, including AI services that may train on submitted data (e.g., Z.ai), is allowed for personnel in the "Engineer" role. |

* Role-Based AI Stack | `` A governance model where the selection and use of AI tools are determined by a user's assigned organizational role and the classification of the data being processed, rather than by individual permissions. For example, access to Z.ai is tied to the "Engineer" role and is only for Public-External data.
* Voluntary High-Risk Posture | `` The strategic decision to adopt and comply with governance frameworks designed for high-risk AI deployments (such as Colorado SB24-205) despite the organization's size and specific use cases not legally requiring it. This posture is driven by the recognition that the downstream impact of the organization's work on student research and the scientific community exceeds its direct organizational footprint.

### 4. Risk Scenario Library

RadioAstronomy.io maintains a library of ten key risk scenarios (R01-R10) that are assessed using the CIS-RAM methodology to determine Inherent Risk and Residual Risk. This library forms the basis of the organization's risk management program.

* R01 - Data Egress & Exposure | `` The risk of Protected or Secrets data being transmitted to unauthorized external AI services. Primary controls include DLP, the use of inside-perimeter AI for sensitive data, contractual no-training clauses, and network segmentation.
* R02 - Secrets and Credentials Leakage | `` The risk of authentication materials (API keys, passwords, tokens) entering AI systems, either through prompts or training data. Primary controls include Ansible Vault for secret management, automated secret scanning in repositories, mandatory 90-day credential rotation, and the principle of Least Privilege.
* R03 - Prompt Injection & Tool Abuse | `` The risk of malicious instructions subverting the intended behavior of an AI agent, causing it to perform unauthorized actions. Primary controls include input validation, strict tool permission boundaries defined by the Bounded Latent Space architecture, and comprehensive Audit Logs.
* R04 - PR Poisoning & Infrastructure Drift | `` The risk of malicious or flawed code being introduced into the codebase via AI-assisted pull requests, or of AI-driven infrastructure changes causing drift from the secure baseline. Primary controls include mandatory human code review, Git branch protection rules, and the use of immutable infrastructure patterns.
* R05 - Model Extension & Supply Chain | `` The risk originating from the security practices of third-party AI vendors or the components used in their models. Primary controls include vendor security assessments, thorough contract reviews, and supply chain security controls.
* R06 - Identity & Access Drift | `` The risk of orphaned accounts or service principals retaining excessive permissions over time. Primary controls include quarterly access reviews, a formal account lifecycle management process, and regular permission audits.
* R07 - Hallucination & Inaccurate Output | `` The risk of an AI agent generating confident but factually incorrect information, leading to flawed research or operational errors. Primary controls include mandatory human review for critical outputs, multi-source verification, and validation by a research domain expert.
* R08 - Legal & Compliance Gaps | `` The risk of misalignment with adopted compliance frameworks or inadequacies in contractual agreements with AI vendors. Primary controls include the Framework Crosswalk, regular contract reviews by the CTO, and periodic compliance audits.
* R09 - Cost & Tool Sprawl | `` The risk of uncontrolled "shadow AI" usage by team members and associated budget overruns. Primary controls include centralized budget tracking, the authoritative AI Tool Register, and regular monitoring of AI service usage.
* R10 - Logging & Blind Spots | `` The risk of an insufficient audit trail for AI operations, hindering incident response and forensic analysis. Primary controls include comprehensive logging from all AI services, integration with a SIEM platform, and regular reviews of audit trail completeness.

### 5. Operational Protocols and Tooling

* Claude Projects | `` The feature within Anthropic's Claude platform used to implement the Bounded Latent Space for the Vault Orchestrator and Project Manager agents. Each project provides an isolated context, chat history, and knowledge base, aligning perfectly with the architectural requirements.
* Gemini CLI | `` Google's command-line interface for programmatic access to Gemini models. It is used by the Operations Automation agent to execute autonomous tasks at scale via Google Cloud Platform Service Accounts.
* KiloCode | `` A shared access mechanism that enables multiple engineers to work within a unified request budget for Z.ai's GLM-4.6 model. It allows the entire engineering team to share the 2400 requests/6h quota at the Max subscription level, providing a cost-effective solution for non-sensitive coding tasks.
* Obsidian Sync | `` The cloud synchronization service used to create the architectural Substrate. It synchronizes the organization's central Obsidian vault from the CTO's desktop to the server (FSO2) and then to the agent execution environment (agents01), ensuring a consistent single source of truth for all human and AI personnel.
* Z.ai | `` A Chinese AI service provider offering access to the GLM-4.6 model. Due to its policy of training on submitted data, its use is strictly limited to Public-External data (e.g., public open-source code) and is only accessible to personnel with the "Engineer" role.

### 6. Agent Operations and Behavior

* Cross-Space Coordination | `` The operational pattern where AI agents maintain awareness of parallel work streams by observing the Staging message bus. This replaces hierarchical approvals and direct communication, enabling asynchronous and non-blocking coordination. The Vault Orchestrator is responsible for synthesizing patterns from these notifications and surfacing potential conflicts or coordination needs.
* End-of-Session Protocol | `` The standard workflow an AI agent must follow when completing a work session with a human operator. The protocol is: 1) Execute all agreed-upon changes. 2) Update the relevant changelog. 3) Drop a Work Session Notification to Staging.
* Escalation | `` The communication pattern for an AI agent when it is blocked, uncertain of its authority boundary, or encounters a cross-project dependency. The agent flags the issue by posting a notification to Staging and then continues with other tasks in its queue, rather than waiting for a response.
* Scope Discipline | `` A core performance metric for AI agents. It refers to the agent's ability to operate confidently and effectively within its defined Bounded Latent Space without attempting to cross into the domains of other agents.
* Substrate Hygiene | `` A core performance metric for AI agents. It refers to the agent's adherence to proper file handling, naming conventions, and organizational standards within the shared Substrate filesystem, ensuring the knowledge base remains clean and navigable.
* Work Session Notification | `` The standardized format for a notification posted to Staging at the end of a work session. It documents the work completed, the current state of the project, and any relevant cross-space context, enabling the Vault Orchestrator to perform its synthesis function.

### 7. Contextualized Technical Controls

* Audit Log | `` *Usage:* The organization maintains multiple, federated audit logs to ensure a complete record of AI activity. This includes Google Workspace audit logs for Gemini UI usage, Google Cloud Platform service account activity logs for the Gemini CLI, and comprehensive application-level logging, collectively satisfying CIS Controls 8.2 and 8.5.
* DLP (Data Loss Prevention) | `` *Usage:* Technical controls are implemented at the endpoint and network perimeter to prevent Protected data from being transmitted to unauthorized cloud AI models. This is a key technical implementation of CIS Control 9.2 and a primary mitigation for risk scenario R01.
* MFA (Multi-Factor Authentication) | `` *Usage:* MFA is mandatory on all enterprise accounts with access to AI services, including Google Workspace for all personnel, the CTO's Claude account, and all administrative accounts. This is a core control for identity and access management.
* RBAC (Role-Based Access Control) | `` *Usage:* Access to AI tools is governed by the Role-Based AI Stack. Permissions are assigned based on organizational roles (e.g., Engineer role grants access to Z.ai, CTO role grants access to Claude admin settings) rather than being granted to individuals, ensuring consistent and auditable access control.
* Service Account | `` *Usage:* A non-human principal used by the Operations Automation agent (via the Gemini CLI) to access Google Cloud Platform resources. Access is governed by least-privilege IAM roles, managed by the CTO, and generates auditable API call logs in GCP, satisfying CIS Controls 8.2 and 8.5.
* SSO (Single Sign-On) | `` *Usage:* Google Workspace serves as the enterprise identity provider, enabling SSO for access to services like Gemini Pro. This practice helps satisfy CIS Control 5.1 by centralizing identity management.
* Training Opt-Out | `` *Usage:* A contractual control to prevent an AI vendor from using customer data for model training. This is enforced via enterprise agreements for Gemini and Claude. It is explicitly noted in the AI Tool Register that this control is NOT AVAILABLE for Z.ai, which is why its use is restricted to Public-External data.

### 8. Multi-Framework Compliance in Practice

The RadioAstronomy.io compliance strategy is built on the principle of efficiency and integration, recognizing that a single, well-implemented control can often satisfy requirements across multiple frameworks simultaneously. This avoids the significant overhead of managing separate and duplicative compliance programs.

* Compliance Posture | `` The organization's overall adherence to its selected frameworks. The official posture is a Voluntary High-Risk Posture with formal compliance to NIST AI RMF 1.0, CIS Controls v8.1 IG1, ISO 31000:2018 principles, and the principles of Colorado SB24-205.
* Control Mapping | `` The practice and documentation of linking a specific technical or policy control to the requirements it satisfies across multiple frameworks. For example, the implementation of DLP (a control for risk R01) is formally mapped to NIST AI RMF MEASURE 2.7 (Tracking of identified risks), CIS Control 9.2 (Data Loss Prevention), ISO 31000 Clause 6.4 (Risk Treatment), and the "reasonable care" duty under Colorado SB24-205 §6-1-1704(1)(a).
* Framework Crosswalk | `` The formal documentation that demonstrates the organization's Multi-Framework Compliance approach. This document serves as a central reference for auditors, showing how a single control implementation satisfies requirements across NIST AI RMF, CIS Controls, ISO 31000, and Colorado SB24-205 simultaneously.
* Multi-Framework Compliance | `` The strategic approach of implementing a single, robust control to satisfy requirements from multiple compliance frameworks at once. This method maximizes compliance efficiency and ensures that governance is managed as a unified, integrated system rather than a series of disconnected checklists.

## Works cited

1. NIST AI Risk Management Framework 1.0: Meaning, challenges, implementation, accessed October 26, 2025, <https://www.scrut.io/post/nist-ai-risk-management-framework>
2. Artificial Intelligence Risk Management Framework (AI RMF 1.0), accessed October 26, 2025, <https://nvlpubs.nist.gov/nistpubs/ai/nist.ai.100-1.pdf>
3. AI Risk Management Framework | NIST – National Institute of Standards and Technology, accessed October 26, 2025, <https://www.nist.gov/itl/ai-risk-management-framework>
4. NIST AI Risk Management Framework: A simple guide to smarter AI governance - Diligent, accessed October 26, 2025, <https://www.diligent.com/resources/blog/nist-ai-risk-management-framework>
5. Senate Bill 24-205 - Colorado General Assembly |, accessed October 26, 2025, <https://leg.colorado.gov/sites/default/files/2024a\_205\_signed.pdf>
6. The Colorado Artificial Intelligence Act, accessed October 26, 2025, <https://www.nmlegis.gov/handouts/STTC%20072924%20ltem%202%20C%20Colorado%20Al%20Legislation%20Powerpoint.pdf>
7. astropy: A Community Python Library for Astronomy, accessed October 26, 2025, <https://docs.astropy.org/en/stable/index.html>
8. astropy/astropy: Astronomy and astrophysics core library - GitHub, accessed October 26, 2025, <https://github.com/astropy/astropy>
9. Astropy, accessed October 26, 2025, <https://www.astropy.org/>
10. CIS Critical Security Controls: How to Implement v8.1 & Why [+ Checklist] - Secureframe, accessed October 26, 2025, <https://secureframe.com/blog/cis-critical-security-controls>
11. CIS Critical Security Controls, accessed October 26, 2025, <https://www.cisecurity.org/controls>
12. <www.cisecurity.org>, accessed October 26, 2025, <https://www.cisecurity.org/controls\#:\~:text=The%20CIS%20Critical%20Security%20Controls,to%20strengthen%20your%20cybersecurity%20posture>.
13. <www.evolvesecurity.com>, accessed October 26, 2025, <https://www.evolvesecurity.com/glossary/cis-ram\#:\~:text=CIS%20RAM%20is%20a%20set,procedures%20to%20prevent%20future%20incidents>.
14. CIS RAM Express Edition Version 1.0 - Regulations.gov, accessed October 26, 2025, <https://downloads.regulations.gov/FTC-2018-0099-0009/attachment\_1.pdf>
15. CIS Risk Assessment Method | HALOCK for Reasonable Security, accessed October 26, 2025, <https://www.halock.com/services/security-management/cis-ram/>
16. en.wikipedia.org, accessed October 26, 2025, <https://en.wikipedia.org/wiki/Citizen\_science>
17. Citizen science | National Oceanic and Atmospheric Administration, accessed October 26, 2025, <https://www.noaa.gov/office-education/citizen-science>
18. DS9 Reference Manual - Astronomy at the University of Louisville, accessed October 26, 2025, <https://www.astro.louisville.edu/software/xmccd/archive/xmccd-4.1/xmccd-4.1e/docs/ds9/ds9\_ref.pdf>
19. Reference Manual – SAOImageDS9, accessed October 26, 2025, <http://ds9.si.edu/doc/ref/>
20. Preparing FAIR data for reuse and reproducibility - Cornell Data Services, accessed October 26, 2025, <https://data.research.cornell.edu/data-management/sharing/fair/>
21. FAIR data – Wikipedia, accessed October 26, 2025, <https://en.wikipedia.org/wiki/FAIR\_data>
22. FAIR Principles – GO FAIR, accessed October 26, 2025, <https://www.go-fair.org/fair-principles/>
23. <www.cisecurity.org>, accessed October 26, 2025, <https://www.cisecurity.org/controls/implementation-groups\#:\~:text=Implementation%20Groups%20(IGs)%20are%20the,are%20divided%20into%20three%20groups>.
24. CIS Critical Security Controls Implementation Groups, accessed October 26, 2025, <https://www.cisecurity.org/controls/implementation-groups>
25. CIS Controls | Arctic Wolf, accessed October 26, 2025, <https://arcticwolf.com/resources/glossary/cis-critical-security-controls/>
26. Implementation Groups, accessed October 26, 2025, <https://dese.ade.arkansas.gov/Files/CIS\_Controls\_v8\_Implementation\_Groups\_handout\_20220126125456.pdf>
27. CIS Critical Security Controls Implementation Group 1, accessed October 26, 2025, <https://www.cisecurity.org/controls/implementation-groups/ig1>
28. Inherent and Residual Risk | TN.gov, accessed October 26, 2025, <https://www.tn.gov/content/dam/tn/finance/accounts/Inherent-vs-RisidualRisk.pdf>
29. Understanding Inherent Vs. Residual Risk Assessments - Resolver, accessed October 26, 2025, <https://www.resolver.com/blog/inherent-vs-residual-risk-assessment/>
30. IRAF - Wikipedia, accessed October 26, 2025, <https://en.wikipedia.org/wiki/IRAF>
31. IRAF 2.18.1 | IRAF Community Distribution, accessed October 26, 2025, <https://iraf-community.github.io/>
32. ISO 31000 Risk Management Framework: Your Complete Guide USA - Protecht, accessed October 26, 2025, <https://www.protechtgroup.com/en-us/blog/iso-31000-risk-management-framework-your-complete-guide>
33. What is ISO 31000: Full Form, Purpose & Risk Definition - NovelVista, accessed October 26, 2025, <https://www.novelvista.com/blogs/quality-management/why-iso-31000-matters>
34. <www.protechtgroup.com>, accessed October 26, 2025, <https://www.protechtgroup.com/en-us/blog/iso-31000-risk-management-framework-your-complete-guide\#:\~:text=ISO%2031000%20is%20an%20international,%2C%20treating%2C%20and%20monitoring%20risk>.
35. Developer Documentation - Proxmox VE, accessed October 26, 2025, <https://pve.proxmox.com/wiki/Developer\_Documentation>
36. Installation - Proxmox Virtual Environment, accessed October 26, 2025, <https://www.proxmox.com/en/products/proxmox-virtual-environment/get-started>
37. en.wikipedia.org, accessed October 26, 2025, <https://en.wikipedia.org/wiki/ISO\_31000\#:\~:text=and%20operational%20resilience.-,Definitions,risk%20analysis%2C%20and%20risk%20evaluation>.
38. ISO/IEC 31000 for Risk Management – Splunk, accessed October 26, 2025, <https://www.splunk.com/en\_us/blog/learn/iso-31000.html>
39. CIS Critical Security Controls: The Complete Guide - Splunk, accessed October 26, 2025, <https://www.splunk.com/en\_us/blog/learn/cis-critical-security-controls.html>
40. List of 18 CIS Critical Security Controls: Updated V8 Complete Checklist – Sprinto, accessed October 26, 2025, <https://sprinto.com/blog/cis-controls/>
41. In Conversation with NIST: AI Risk Management - Holistic AI, accessed October 26, 2025, <https://www.holisticai.com/blog/in-conversation-with-nist-ai-risk-management>
42. Value Added catalogs - LAMOST DR8 v2.0, accessed October 26, 2025, <https://www.lamost.org/dr8/v2.0/doc/vac>
43. APOGEE value-added catalogue of Galactic globular cluster stars | Monthly Notices of the Royal Astronomical Society | Oxford Academic, accessed October 26, 2025, <https://academic.oup.com/mnras/article/528/2/1393/7296142>
44. DR18 Value Added Catalogs - SDSS-V, accessed October 26, 2025, <https://www.sdss.org/dr18/data\_access/value-added-catalogs/>
45. Terms of Use | Zenodo, accessed October 26, 2025, <https://about.zenodo.org/terms/>
46. What are projects? | Claude Help Center, accessed October 26, 2025, <https://support.claude.com/en/articles/9517075-what-are-projects>
47. Hands-on with Gemini CLI - Google Codelabs, accessed October 26, 2025, <https://codelabs.developers.google.com/gemini-cli-hands-on>
48. Welcome to Gemini CLI documentation | Gemini CLI Docs, accessed October 26, 2025, <https://gemini-cli.xyz/docs/en>
49. Kilo Code - The best AI coding agent for VS Code and JetBrains, accessed October 26, 2025, <https://kilocode.ai/>
50. Kilo-Org/kilocode: Open Source AI coding assistant for planning, building, and fixing code. We frequently merge features from open-source projects while building our own vision. Follow us: kilocode.ai/social - GitHub, accessed October 26, 2025, <https://github.com/Kilo-Org/kilocode>
51. Set up Obsidian Sync - Obsidian Help, accessed October 26, 2025, <https://help.obsidian.md/sync/setup>
52. Obsidian Sync, accessed October 26, 2025, <https://obsidian.md/sync>
53. GLM 4.6 by Z.ai on the AI Playground, accessed October 26, 2025, <https://ai-sdk.dev/playground/zai:glm-4.6>
54. GLM-4.6: Advanced Agentic, Reasoning and Coding Capabilities, accessed October 26, 2025, <https://z.ai/blog/glm-4.6>
55.
