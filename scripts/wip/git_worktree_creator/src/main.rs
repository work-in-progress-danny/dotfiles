use clap::Parser;
use std::process::Command;

#[derive(Parser, Debug)]
struct Cli {
    // The Git branch to create a worktree from 
    branch: String,
    // The command to install apps dependencies 
    install_command: String
}

// yeah this is filthy, but it works
fn main() {
    let args = Cli::parse();

    println!("{:?}", args.branch);

    Command::new("git")
        .arg("worktree")
        .arg("add")
        .arg(format!("../{}", args.branch))
        .spawn()
        .expect("oops, something went wrong!")
        .wait()
        .expect("couldn't wait ;)");

    Command::new("cp")
        .arg("-r")
        .arg("./node_modules")
        .arg(format!("../{}", args.branch))
        .spawn()
        .expect("oops, something went wrong!")
        .wait()
        .expect("couldn't wait ;)");

    Command::new("yarn")
        .arg("install")
        .current_dir(format!("../{}", args.branch))
        .spawn()
        .expect("oops, something went wrong!")
        .wait()
        .expect("couldn't wait ;)");

    print!("You'll need to change to that directory now. Run `cd ../<branch-name?`");
}

