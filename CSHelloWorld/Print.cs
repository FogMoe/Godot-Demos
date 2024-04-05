using Godot;
using System;
//C# is the best https://github.com/FogMoe/Godot-Demos
public partial class Print : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GD.Print("Hello, World!");
		//get child node with name "Label"
		Label label = GetNode<Label>("Label");
		//set text of label
		label.Text = "Hello, World!";
		//set position of label
		label.Position = new Vector2(100, 100);


		Sprite2D Icon = GetNode<Sprite2D>("Icon");
		Icon.Visible = true;

	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		//rotate the icon
		Sprite2D Icon = GetNode<Sprite2D>("Icon");
		Icon.Rotation += 0.01f;
	}
}
