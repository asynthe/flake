use std::process::Command;
use std::thread;
use std::time::Duration;

fn main() {
    // ASCII art
    println!(
        r#"
    _______   __
   / ____/ | / /
  / __/ /  |/ / 
 / /___/ /|  /  
/_____/_/ |_/   
"#
    );

    // Run the 'nix flake update' command
    let output = Command::new("nix")
        .arg("flake")
        .arg("update")
        .output()
        .expect("Failed to execute command");

    // Loading bar
    print!("Updating flake: [");
    for _ in 0..10 {
        print!("=");
        thread::sleep(Duration::from_secs(1));
    }
    println!("]");

    // Print the command output
    println!("Command output: {:?}", output);

    // Check if the command was successful
    if output.status.success() {
        println!("Command executed successfully");
    } else {
        eprintln!("Error executing command: {:?}", output.status);
        eprintln!(
            "Command stderr: {}",
            String::from_utf8_lossy(&output.stderr)
        );
    }
}
