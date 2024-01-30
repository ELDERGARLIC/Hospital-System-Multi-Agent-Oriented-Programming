# Project Overview

This project involves the development of a multi-agent system (MAS) using JaCaMo, designed for a hospital environment focusing on complex challenges within the healthcare domain through the development of a Multi-Agent System (MAS) using the JaCaMo platform. Integration of advanced technologies and intelligent systems has become critical in ensuring efficient, patient-centric care in the last years.

The Multi-Agent System (MAS) for healthcare management consists of system components designed to collaboratively address diverse healthcare scenarios. At its core are intelligent agents representing distinct roles, including doctors, paramedics, nurses, and patients, each equipped with specialized functionalities and decision-making capabilities.

These agents interact with artifacts such as the HeartRateMonitor and PatientCareSystem, which centralize critical functionalities such as heart rate monitoring, decision-making processes, and patient prioritization.

The organizational specifications, `emergency_room_org.xml` and `healthcare_org.xml`, delineate the roles, group structures, functional goals, and normative rules, fostering a structured and rule-based environment. These organizational guidelines ensure that agents operate cohesively within their designated roles, contributing to decentralized decision-making and effective patient care.

## Borda Count Algorithm

![image](https://github.com/ELDERGARLIC/Hospital-System-Multi-Agent-Oriented-Programming/assets/52277462/56cdb79a-150f-4f8c-9b99-17c3852d0ece)

“The Borda count is a family of positional voting rules which gives each candidate, for each ballot, a number of points corresponding to the number of candidates ranked lower. In the original variant, the lowest-ranked candidate gets 0 points, the next-lowest gets 1 point, etc., and the highest-ranked candidate gets n − 1 points, where n is the number of candidates. Once all votes have been counted, the option or candidate with the most points is the winner.”

In our project, we used the Borda count algorithm in the PatientCareSystem artifact to choose the highest priority patient in the emergency room and give the chosen patient treatment by the nurses available in the system. Nurses will choose their priorities and send them to the doctor agent. The doctor agent will use PatientCareSystem artifact, which utilizes the Borda count algorithm and decides which patient has the highest priority.

## System Components

### Agents

#### Doctor Agent

The Doctor Agent focuses on patient care and heart rate monitoring. Using the Borda count algorithm, the Doctor Agent participates in decision-making processes, contributing to the prioritization of patients. This agent's responsibilities include monitoring and responding to patient conditions, ensuring effective communication within the healthcare team, and making informed decisions based on the overall well-being of patients.

#### Paramedic Agent

The Paramedic Agent is specialized in monitoring heart rates and initiating actions based on predefined thresholds. This agent is responsible for ensuring the safety and well-being of patients by actively monitoring heart rates. In instances where a patient's heart rate exceeds safe thresholds, the Paramedic Agent takes appropriate actions, such as alerting the healthcare team or initiating emergency protocols. The Paramedic Agent contributes to the overall patient care strategy by providing real-time information on critical health parameters.

#### Nurse Agents

Nurse Agents are actively engaged in patient care and treatment processes. These agents play an important role in the voting mechanism for patient prioritization, leveraging their insights and expertise to contribute to decision-making. Nurse Agents also facilitate communication within the healthcare team, ensuring that information flows seamlessly between different entities. Their responsibilities include adhering to normative specifications, participating in the treatment of patients, and collaborating with other agents to provide comprehensive healthcare services.

#### Patient Agents

Patient Agents represent individuals within the MAS who undergo treatment based on their medical conditions. These agents actively participate in the decision-making process by contributing to the voting mechanism for patient prioritization. Patient Agents communicate their medical conditions to the healthcare team, allowing for personalized and targeted care. Additionally, they play a role in the overall patient care strategy, providing valuable input through the voting process to influence the prioritization of treatments and interventions.

### Artifacts

#### PatientCareSystem Artifact

The PatientCareSystem artifact serves as the orchestrator of the patient prioritization process within the healthcare system. This artifact manages the voting mechanism, allowing doctors, nurses, and patients to contribute to the decision-making process. By overseeing the opening, voting, and closing phases, it facilitates efficient communication among agents and ensures a decentralized approach to patient prioritization. The artifact's modular design enhances the adaptability of the system, making it a central component in the collaborative decision-making framework of the MAS.

#### HeartRateMonitor Artifact

The HeartRateMonitor artifact plays a crucial role in simulating and monitoring the heart rates of patients within the healthcare system. Through its methods, such as setHeartRate and startMonitoring, it enables paramedics to monitor and respond to changes in patients' heart rates. The artifact, with its internal operation updateHeartRateProc, emulates continuous heart rate updates during monitoring. By providing a standardized interface for heart rate management, this artifact contributes to the system's ability to respond dynamically to health-related events and supports effective patient care.

### Workspace

#### hospital

The hospital workspace within the Multi-Agent System (MAS) serves as the central environment where healthcare activities unfold. Defined as the "hospital" artifact in the MAS project, this workspace encapsulates crucial artifacts such as the PatientCareSystem and HeartRateMonitor. The PatientCareSystem artifact manages the intricate process of patient prioritization through a voting mechanism, engaging doctors, nurses, and patients in decentralized decision-making. Simultaneously, the HeartRateMonitor artifact simulates and monitors heart rates, providing essential data for timely interventions by paramedics.

### Organization

#### Emergency Room Organization (`emergency_room_org.xml`)

The Emergency Room Organization (`emergency_room_org.xml`) establishes a structured framework for role-based coordination within an emergency medical scenario.

The organizational specification defines two roles, "pathological" and "normal," representing agents in critical and stable conditions, respectively.

The group specification, denoted as `emergency_room_grp`, delineates the allowable roles and their relationships within the emergency room setting. The roles are interconnected with links, with the "pathological" role possessing an authority over the "normal" role in intra-group interactions.

The formation constraints ensure compatibility between these roles. The functional specification, encapsulated in the `emergency_room_sch` scheme, outlines missions and goals to be achieved by the agents. Notably, the "treatment" goal orchestrates a sequence of sub-goals, including informing about medical conditions and undergoing treatment.

Normative specifications define obligations, such as ensuring that agents with the "pathological" role fulfill the "telling_mission." In summary, this organizational structure orchestrates a dynamic and well-defined emergency room environment, where roles, goals, and norms collectively contribute to effective healthcare management.

#### Healthcare Organization (`healthcare_org.xml`)

The Healthcare Organization, defined in `healthcare_org.xml`, serves as a foundational structure for orchestrating healthcare-related activities within the Multi-Agent System (MAS).

The organization establishes three primary roles "doctor," "patient," and "nurse" each with specified participation constraints. The organizational framework outlines a functional scheme named "choose," which encompasses goals for opening, voting on patients, and closing the process.

Normative specifications introduce obligations that reinforce role-specific responsibilities, such as the "doctor" obligation to manage the mission and the "nurse" obligation to participate in the patient voting mission. This organization creates a structured environment for collaborative decision-making and patient prioritization, aligning roles and missions to achieve cohesive healthcare management within the MAS.

## System Workflow

The system workflow is orchestrated through a combination of agent interactions and organizational specifications, ensuring seamless healthcare management within the Multi-Agent System (MAS).

The PatientCareSystem artifact manages patient prioritization through a decentralized voting process involving doctors, nurses, and patients. The result of this prioritization influences decision-making and subsequent patient care.

Meanwhile, the HeartRateMonitor artifact simulates and monitors heart rates, with paramedics actively engaged in overseeing heart rate changes and taking appropriate actions.

Agent communication is facilitated to share vital information such as medical conditions, preferences, and treatment processes.

The organizational specifications, defined in emergency_room_org.xml and healthcare_org.xml, guide these interactions, enforcing role-based obligations and maintaining a structured workflow that aligns with predefined rules and goals.
