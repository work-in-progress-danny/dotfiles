use std::fs;

use dirs::home_dir;
use rand::seq::SliceRandom;

fn main() -> std::io::Result<()> {
    let emojis = [
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
        "🦆",
        "😋",
        "🤭",
        "🥲",
        "🤪",
        "🤓",
        "🤩",
        "🥳",
    ];

    let new_emoji = emojis.choose(&mut rand::thread_rng()).unwrap();

    let gitconfig_path = home_dir().unwrap().join(".gitconfig");
    let contents = fs::read_to_string(&gitconfig_path)
        .unwrap()
        .split('\n')
        .map(|line| {
            if line.contains("name =") {
                format!("    name = \"Danny Lowater {}\"", new_emoji)
            } else {
                line.to_string()
            }
        })
        .collect::<Vec<String>>()
        .join("\n");

    println!("New emoji: {}", new_emoji);

    fs::write(gitconfig_path, contents)
}
