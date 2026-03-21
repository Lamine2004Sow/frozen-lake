import gymnasium as gym
from gymnasium.envs.toy_text.frozen_lake import generate_random_map

lake = gym.make('FrozenLake-v1', desc=generate_random_map(size=8), render_mode='human',  is_slippery=True)

obs, info = lake.reset()

done = False
while not done:
    action = lake.action_space.sample()        # action aléatoire
    obs, reward, terminated, truncated, info = lake.step(action)
    done = terminated or truncated
    lake.render()                              # affiche à chaque step

lake.close()
