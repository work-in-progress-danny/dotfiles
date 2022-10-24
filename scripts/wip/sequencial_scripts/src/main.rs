// fn main() {
// use std::process::Command;
// let dir = "/Users/danny.lowater/work/develop-module/frontend";
// println!("Running tests..");

// let jest = Command::new("jest")
//     .current_dir(dir)
//     .arg("--colors")
//     .output()
//     .expect("failed to execute jest");

// if jest.status.success() {
//     println!("✅ jest")
// } else {
//     println!("❌ jest")
// }

// // let stylelint = Command::new("yarn")
// //     .current_dir(dir)
// //     .arg("stylelint")
// //     .output()
// //     .expect("failed to execute stylelint");

// // if stylelint.status.success() {
// //     println!("✅ stylelint")
// // } else {
// //     println!("❌ stylelint")
// // }

// let lint = Command::new("yarn")
//     .current_dir(dir)
//     .arg("lint")
//     .output()
//     .expect("failed to execute lint:fix");

// if lint.status.success() {
//     println!("✅ lint:fix")
// } else {
//     println!("❌ lint:fix")
// }

// if !jest.status.success() {
//     println!("\nJest");
//     println!("{}", String::from_utf8(jest.stderr).ok().unwrap());
// }
// // if !stylelint.status.success() {
// //     println!("\nstylelint");
// //     println!("{}", String::from_utf8(stylelint.stderr).ok().unwrap())
// // }
// if !lint.status.success() {
//     println!("\nlint");
//     println!("{}", String::from_utf8(lint.stderr).ok().unwrap());
// }
// }

// use std::io::{BufRead, BufReader, Error, ErrorKind};
// use std::process::{Command, Stdio};

// fn main() -> Result<(), Error> {
//     let dir = "/Users/danny.lowater/work/develop-module/frontend";

//     let stdout = Command::new("jest")
//         .current_dir(dir)
//         .arg("--colors")
//         .stdout(Stdio::piped())
//         .spawn()?
//         .stdout
//         .ok_or_else(|| Error::new(ErrorKind::Other, "Could not capture standard output."))?;

//     let reader = BufReader::new(stdout);

//     reader
//         .lines()
//         .filter_map(|line| line.ok())
//         // .filter(|line| line.find("usb").is_some())
//         .for_each(|line| println!("{}", line));

//     Ok(())
// }

use std::{
    io::stdout,
    process::{Command, Stdio},
};

use crossterm::{
    terminal::{EnterAlternateScreen, LeaveAlternateScreen},
    ExecutableCommand, Result,
};

fn main() -> Result<()> {
    let dir = "/Users/danny.lowater/work/develop-module/frontend";

    // stdout().execute(EnterAlternateScreen)?;

    let jest_result = Command::new("jest")
        .current_dir(dir)
        .arg("--colors")
        .spawn()
        .expect("")
        .wait();

    // let output = jest_result.output().ok().unwrap();

    // stdout().execute(LeaveAlternateScreen).ok();
    println!("{:?}", jest_result);

    // if !jest_result.status.success() {
    //     println!("JEST FUCKING FAILED");
    //     println!("{}", String::from_utf8(jest_result.stdout).ok().unwrap());
    //     println!("{}", String::from_utf8(jest_result.stderr).ok().unwrap())
    // }

    Ok(())
}

// what I want it to be
// run a single script to run all pre-push checks
// I want each script print its out put then clear it, and only if it fails capture and print the output
