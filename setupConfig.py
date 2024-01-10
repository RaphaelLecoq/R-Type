import tkinter as tk
from tkinter import filedialog, messagebox, simpledialog
import json

# Config data structure
config_data = {
    "scenes": [
        {"Game": {
            "textures": [],
            "fonts": [],
            "sounds": [],
            "music": [],
            "entities": [],
            "templates": []
        }}
    ]
}

# Add a texture
def add_texture():
    texture_name = simpledialog.askstring("Input", "Enter texture name:", parent=app)
    file_path = filedialog.askopenfilename(title="Select Texture File")
    if file_path and texture_name:
        config_data["scenes"][0]["Game"]["textures"].append({texture_name: file_path})

# Add a font
def add_font():
    font_name = simpledialog.askstring("Input", "Enter font name:", parent=app)
    file_path = filedialog.askopenfilename(title="Select Font File")
    if file_path and font_name:
        config_data["scenes"][0]["Game"]["fonts"].append({font_name: file_path})

# Add an entity
def add_entity_dialog():
    def save_entity():
        entity = {
            entity_name_var.get(): {
                "TextureInfo": texture_info_var.get(),
                "Script": script_path_var.get(),
                "Renderable": int(renderable_var.get()),
                "Transform": {
                    "position": {"x": float(position_x_var.get()), "y": float(position_y_var.get())},
                    "rotation": float(rotation_var.get()),
                    "scale": {"x": float(scale_x_var.get()), "y": float(scale_y_var.get())}
                }
            }
        }
        config_data["scenes"][0]["Game"]["templates"].append(entity)
        entity_window.destroy()

    entity_window = tk.Toplevel(app)
    entity_window.title("Add Entity")

    tk.Label(entity_window, text="Entity Name:").pack()
    entity_name_var = tk.StringVar()
    tk.Entry(entity_window, textvariable=entity_name_var).pack()

    tk.Label(entity_window, text="Texture Info:").pack()
    texture_info_var = tk.StringVar()
    tk.Entry(entity_window, textvariable=texture_info_var).pack()

    tk.Label(entity_window, text="Script Path:").pack()
    script_path_var = tk.StringVar()
    tk.Entry(entity_window, textvariable=script_path_var).pack()

    tk.Label(entity_window, text="Renderable (0 or 1):").pack()
    renderable_var = tk.StringVar()
    tk.Entry(entity_window, textvariable=renderable_var).pack()

    tk.Label(entity_window, text="Position X:").pack()
    position_x_var = tk.StringVar()
    tk.Entry(entity_window, textvariable=position_x_var).pack()

    tk.Label(entity_window, text="Position Y:").pack()
    position_y_var = tk.StringVar()
    tk.Entry(entity_window, textvariable=position_y_var).pack()

    tk.Label(entity_window, text="Rotation:").pack()
    rotation_var = tk.StringVar()
    tk.Entry(entity_window, textvariable=rotation_var).pack()

    tk.Label(entity_window, text="Scale X:").pack()
    scale_x_var = tk.StringVar()
    tk.Entry(entity_window, textvariable=scale_x_var).pack()

    tk.Label(entity_window, text="Scale Y:").pack()
    scale_y_var = tk.StringVar()
    tk.Entry(entity_window, textvariable=scale_y_var).pack()

    save_button = tk.Button(entity_window, text="Save Entity", command=save_entity)
    save_button.pack()

def update_entities():
    for entity in config_data["scenes"][0]["Game"]["templates"]:
        # Skip entities that are not set to renderable
        if entity.get("Renderable", 0) != 1:
            continue

        control = entity.get("Control", {})
        transform = entity.get("Transform", {})
        speed = 5  # You can adjust the speed as needed

        if control.get("straight", False):
            # Move straight in the positive y-direction
            transform["position"]["y"] += speed
        elif control.get("random", False):
            # Move randomly in both x and y directions
            import random
            transform["position"]["x"] += random.uniform(-speed, speed)
            transform["position"]["y"] += random.uniform(-speed, speed)

    # Call the function again after a certain time (in milliseconds)
    app.after(100, update_entities)

# Save the config file
def save_config():
    with open('config.cfg', 'w') as file:
        json.dump(config_data, file, indent=4)
    messagebox.showinfo("Info", "Config saved successfully!")

# GUI Setup
app = tk.Tk()
app.title("Config Generator")

add_texture_button = tk.Button(app, text="Add Texture", command=add_texture)
add_texture_button.pack()

add_font_button = tk.Button(app, text="Add Font", command=add_font)
add_font_button.pack()

add_entity_button = tk.Button(app, text="Add Entity", command=add_entity_dialog)
add_entity_button.pack()

save_button = tk.Button(app, text="Save Config", command=save_config)
save_button.pack()

update_entities()

app.mainloop()
