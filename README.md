# AI Autonomous System – Warehouse Planning

This repository contains the final project for the **AI for Robotics II** course at the University of Genoa.  
It demonstrates advanced **AI planning and robotic coordination** using **PDDL+**, with a focus on efficiency, scalability, and real-world applicability.

## 🚀 Project Overview
The project models an **automated warehouse system** where multiple robots collaborate to move crates to a conveyor belt:
- Two **mover robots** transport crates across the warehouse.
- One **loader robot** places crates onto the conveyor belt.
- Heavy crates (>50kg) require two movers; fragile crates require special handling with slower loading.

This scenario captures the complexity of **multi-agent planning under numeric and temporal constraints**, making it an ideal benchmark for AI planning engines.

## 🎯 Objectives
- Develop a **PDDL+ domain model** that encodes warehouse operations, constraints, and extensions.  
- Design **problem instances** of increasing complexity to test scalability.  
- Implement **heuristics and symbolic patterns** to guide search and improve solver performance.  
- Validate solutions using **state-of-the-art planning engines** (ENHSP, LPG).  

## 🔑 Key Features
- **Numeric & Temporal Planning**: Models crate movement times, robot speeds, and loading durations.  
- **Constraint Handling**:  
  - Heavy crates → require 2 movers.  
  - Fragile crates → require 2 movers + slower loading.  
  - Grouped crates → must be loaded sequentially.  
- **Optional Extensions**:  
  - Dual loaders with different capabilities.  
  - Battery recharging for mover robots.  
  - Fragile crate handling with extended loading times.  
- **Heuristic Design**: Custom function to estimate distance-to-goal and prioritize efficient states.  
- **Pattern-Based Approach**: Symbolic abstraction to bound search space and improve scalability.  

## 🛠️ How to Run
1. Install a compatible planning engine:  
   - [ENHSP](https://sites.google.com/view/enhsp/) (numeric planning)  
   - [LPG](https://lpg.unibs.it/lpg/) (temporal planning)  
2. Load the `domain.pddl` file and one of the problem files (`problem0.5.pddl`, `problem1.pddl`, etc.).  
3. Run the planner to generate a plan for crate movement and loading.  
4. Analyze the output plan, heuristic performance, and scalability across problem sizes.  

## 📂 Repository Structure
- `domain.pddl` → PDDL+ domain model  
- `problemX.pddl` → Problem instances (0.5, 1, 2, 3, 4)  
- `Ai2_final Project.pdf` → Report with heuristics, patterns, and analysis  
- `output/` → Planner outputs and logs  

## ✨ Impact
This project demonstrates the ability to:  
- Model **complex robotic systems** with formal planning languages.  
- Bridge theory (AI planning) with practice (robotic warehouse automation).  
- Design **heuristics and symbolic abstractions** that improve solver efficiency.  
- Work with **cutting-edge planning engines** and analyze their performance.  

---

👩‍💻 Developed and documented by **Lisa Mokrani**  
Master’s in Robotics Engineering – University of Genoa
