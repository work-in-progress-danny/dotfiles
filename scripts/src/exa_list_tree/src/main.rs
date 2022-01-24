use clap::Parser;
use std::process::Command;

#[derive(Parser)]
struct Cli {
    /// The pattern to look for
    depth: String,
    /// The path to the file to read
    #[clap(parse(from_os_str))]
    path: std::path::PathBuf,
}

fn main() {
    let args = Cli::parse();

    // $path / exa --tree --level={depth} -hal --git --time-style=long-iso
    Command::new("exa")
        .current_dir("/")
        .arg(args.path)
        .arg(format!("--level={}", args.depth))
        .arg("--tree")
        .arg("-hal")
        .arg("--git")
        .arg("--time-style=long-iso")
        .spawn()
        .expect("oops");
}
