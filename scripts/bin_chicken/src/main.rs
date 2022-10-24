use std::path::Path;

use clap::Parser;
use dialoguer::Confirm;

/// Bin Chicken A sane alternative to the UNIX rm command
#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None )]
struct Args {
    #[arg(required = true)]
    path: String,
    #[arg(short, long)]
    debug: bool,
}

fn main() {
    let Args { path, debug } = Args::parse();

    if !Path::new(&path).exists() {
        println!("No such file or directory \"{path}\"");
        return;
    }

    Confirm::new()
        .with_prompt(format!("Remove {path}?"))
        .interact()
        .unwrap();

    match trash::delete(&path) {
        Ok(..) => println!("🗑️🐔"),
        Err(e) => {
            if debug {
                println!("Debug output:\n\n{:?}", e)
            } else {
                println!("No such file or directory \"{path}\"");
            }
        }
    };
}
