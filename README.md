---
title: Tabular Reinforcement Learning — From Scratch
date: 2026-03-20
author: Mouhamadou Lamine SOW
---

# Tabular Reinforcement Learning — From Scratch

## Introduction

Ce projet implémente et compare les principaux algorithmes de **Reinforcement Learning tabulaire** en Python, entièrement **from scratch**, sans recourir à des bibliothèques RL existantes (pas de Stable-Baselines, pas de RLlib).

L'environnement utilisé est **FrozenLake-v1** (Gymnasium) — un lac gelé en grille 2D dans lequel un agent apprend à atteindre un objectif en évitant les trous. L'environnement est utilisé en mode **stochastique** (`is_slippery=True`) : l'agent ne va pas toujours dans la direction choisie, ce qui rend le problème réaliste et non trivial. Le mode déterministe est obtenu simplement en fixant les probabilités de transition à 1 (`is_slippery=False`), ce qui permet de valider les algorithmes avant de les confronter à l'incertitude.

Le projet couvre le spectre complet de la décision séquentielle : des méthodes de **Programmation Dynamique** (qui connaissent le modèle de l'environnement et calculent la solution exacte) aux méthodes de **RL pur** (qui apprennent uniquement par interaction), en passant par **Monte Carlo** et les méthodes **TD (Temporal Difference)**.

Tous les entraînements sont trackés avec **Weights & Biases (WandB)** et visualisés sous forme de **courbes, heatmaps et GIFs animés**.

---

## Objectifs

### Objectif principal
Comprendre en profondeur les différences théoriques et pratiques entre les algorithmes tabulaires classiques, en les implémentant from scratch et en analysant leur comportement sur des expériences contrôlées.

### Algorithmes comparés

| # | Méthode | Type | Connaissance du modèle |
|---|---------|------|------------------------|
| 1 | **Value Iteration** | Programmation Dynamique |  Complète — référence optimale |
| 2 | **Policy Iteration** | Programmation Dynamique |  Complète — référence optimale |
| 3 | **Monte Carlo** | RL — sans bootstrapping |  Aucune |
| 4 | **Q-Learning** | RL — off-policy |  Aucune |
| 5 | **SARSA** | RL — on-policy |  Aucune |
| 6 | **Expected SARSA** | RL — on-policy |  Aucune |

> Les méthodes DP (1 & 2) servent de **référence optimale**. Tous les algos RL sont évalués par rapport à cette baseline.

### Axes d'étude

1. **Convergence** — En combien d'épisodes chaque méthode atteint-elle la politique optimale ? Chaque courbe RL est comparée à la ligne de référence DP.

2. **Stabilité** — Les résultats sont-ils reproductibles ? Chaque algorithme est entraîné sur 10 seeds différentes et la variance est mesurée.

3. **Sensibilité aux hyperparamètres** — Comment le learning rate (α), le discount factor (γ) et l'exploration (ε) influencent-ils les performances ?

4. **Stochasticité** — Comment chaque algo se comporte-t-il quand l'environnement devient imprévisible ? Comparaison déterministe (`is_slippery=False`) vs stochastique (`is_slippery=True`) pour tous les algos.

### Métriques collectées

| Métrique | Description |
|----------|-------------|
| Reward cumulé | Par épisode — courbe de convergence |
| Variance inter-seeds | Sur 10 runs — stabilité |
| Reward final moyen | Moyenne des 100 derniers épisodes |
| Longueur du chemin | Nombre de steps pour atteindre le but |
| Value Function V(s) | Heatmap de la valeur de chaque état |
| Politique π(s) | Flèches directionnelles sur la grille |
| Écart à l'optimal | % de l'optimal DP atteint par chaque algo |