use clap::Parser;
use std::{env, process::Command};

#[derive(Parser, Debug)]
struct Cli {
    /// The pattern to look for
    depth: String,
    /// The path to the file to read
    #[clap(parse(from_os_str), default_value = "")]
    path: std::path::PathBuf,
}

// yeah this is filthy, but it works
fn main() {
    let args = Cli::parse();
    let mut path = args.path.clone();

    if args.path.to_str().unwrap() == "" {
        path = env::current_dir().ok().unwrap();
    }

    // $path / exa --tree --level={depth} -hal --git --time-style=long-iso
    Command::new("exa")
        .current_dir("/")
        .arg(path)
        .arg(format!("--level={}", args.depth))
        .arg("--tree")
        .arg("-hal")
        .arg("--git")
        .arg("--time-style=long-iso")
        .spawn()
        .expect("oops");
}
