import json
import os
from pathlib import Path

os.system("termux-battery-status > data.json")
path = Path("data.json")
content = path.read_text()
data = json.loads(content)

print(f"Percentage: {data['percentage']}%")
print(f"Status: {data['status']}")
os.remove("data.json")
