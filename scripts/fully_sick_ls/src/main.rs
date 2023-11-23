use clap::Parser;
use std::{path::Path, process::Command};
use colored::*;

// A fully sick implementation of exa, which is a fully sick implementation of UNIX's ls command
// https://github.com/ogham/exa
#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None )]
struct Args {
    /// The path to the file to read
    #[arg(default_value = "./")]
    path: String,
    /// The pattern to look for
    #[arg(default_value = "1")]
    depth: String,
}

fn is_valid_directory<P: AsRef<Path>>(path: P) -> bool {
    path.as_ref().is_dir()
}

fn is_valid_integer(s: &str) -> bool {
    s.parse::<i32>().is_ok()
}

fn print_usage() {
    println!("{} {} {} {} {}",
             "Usage:".bold(),
             "fully_sick_ls".green(),
             "<path>".yellow(),
             "optional:",
             "<depth>".blue(),
             );
}

fn main() {
    let Args { path, depth } = Args::parse();
    let full_path = Path::new(&path);
    let full_depth = format!("--level={}", depth);

    if !is_valid_directory(&full_path) {
        println!("\"{}\" is an invalid directory", full_path.display());
        print_usage();
        return ();
    }
    
    if !is_valid_integer(&depth) {
        println!("\"{}\" is not a number", depth);
        print_usage();
        return ();
    }

    let args = [
        &full_depth,
        "--tree",
        "-hal",
        "--git",
        "--time-style=long-iso",
        "--group-directories-first",
    ];

    // The full command looks like
    // {path} exa --tree --group-directories-first --level={depth} -hal --git --time-style=long-iso
    Command::new("exa")
        .current_dir(full_path)
        .args(args)
        .spawn()
        .unwrap()
        .wait()
        .unwrap();
}
