use std::fs::{write, File};
use std::io::prelude::*;
use std::io::BufReader;

use dirs::home_dir;
use rand::seq::SliceRandom;
use regex::Regex;

fn main() -> std::io::Result<()> {
    let emjois = [
        "😁",
        "🙃",
        "🫠",
        "😇",
        "👽",
        "🫶",
        "👉👈",
        "🧠",
        "🤜🤛",
        "🙉🙈🙊",
        "👌",
        "😍",
        "🫡",
        "😴",
        "🤠",
        "🥸",
    ];

    let new_emoji = emjois.choose(&mut rand::thread_rng()).unwrap();

    let path = home_dir().unwrap().join(".dotfiles/home/local.nix");
    let file = File::open(&path)?;
    let mut buf_reader = BufReader::new(&file);

    let mut contents = String::new();
    buf_reader.read_to_string(&mut contents)?;

    // WHAT THE ACTUAL FUCK, YOU CAN NAME CAPTURE GROUPS... AHH 😍
    let re = Regex::new(r#""(?P<name>Danny Lowater) (?P<emoji>.*)""#).unwrap();
    let str = &contents;

    match re.captures(str) {
        Some(r) => println!("old emoji: {}, new emoji: {}", &r["emoji"], new_emoji),
        _ => panic!("Couldn't find 'Danny Lowater' in \n {}", &str),
    };

    let result = re.replace(str, format!("\"$name {}\"", new_emoji));

    match write(path, result.to_string().as_bytes()) {
        Ok(_) => {
            println!("Done.");
            Ok(())
        }
        Err(err) => panic!("Failed to write data: {}", err),
    }
}
