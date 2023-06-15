use time::Time;
use regex::Regex;

fn main() {
    let t = Time::MIDNIGHT;
    println!("Midnight: {}", t);
    
    let re = Regex::new(r"(?x)
(?P<year>\d{4})  # the year
-
(?P<month>\d{2}) # the month
-
(?P<day>\d{2})   # the day
").unwrap();
    let caps = re.captures("2023-03-14").unwrap();

    println!("Year:{} Month:{} Day:{}", caps["year"].to_string(), caps["month"].to_string(), caps["day"].to_string());

    println!("Hello, world!");
}
