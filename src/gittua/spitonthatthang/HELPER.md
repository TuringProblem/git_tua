```
(* ANSI color codes *)
let red = "\027[31m"
let green = "\027[32m"
let yellow = "\027[33m"
let blue = "\027[34m"
let magenta = "\027[35m"
let cyan = "\027[36m"
let reset = "\027[0m"
let bold = "\027[1m"

(* ASCII Art Logo *)
let display_logo () =
  print_endline (cyan ^ bold ^ "
    ██████╗  ██╗████████╗████████╗██╗   ██╗ █████╗ 
    ██╔════╝ ██║╚══██╔══╝╚══██╔══╝██║   ██║██╔══██╗
    ██║  ███╗██║   ██║      ██║   ██║   ██║███████║
    ██║   ██║██║   ██║      ██║   ██║   ██║██╔══██║
    ╚██████╔╝██║   ██║      ██║   ╚██████╔╝██║  ██║
     ╚═════╝ ╚═╝   ╚═╝      ╚═╝    ╚═════╝ ╚═╝  ╚═╝
    " ^ reset);
  print_endline (magenta ^ "  Git [T]erminal [U]ser [A]pplication {SPIT ON THAT THANG!!}" ^ reset);
  print_endline "";;

(* Progress bar animation *)
let display_progress msg =
  print_string (msg ^ " ");
  for i = 0 to 20 do
    print_string (green ^ "█" ^ reset);
    flush stdout;
  done;
  print_endline "";;

let _ = Sys.command "clear";; (* Clear screen on start *)
display_logo ();;

print_endline (blue ^ bold ^ "Please Enter Github Profile Name: " ^ reset);;
let name = input_line stdin;;

let execute_git_command cmd =
  match Sys.command cmd with
  | 0 -> true
  | _ -> false

let updateRepo () =
  display_progress "Fetching updates...";
  if execute_git_command "git fetch" then begin
    display_progress "Pulling changes...";
    if execute_git_command "git pull" then
      print_endline (green ^ "✓ Successfully updated!" ^ reset)
    else
      print_endline (yellow ^ "⚠ Successfully fetched, but pull failed" ^ reset)
  end else 
    print_endline (red ^ "✗ Fetch failed" ^ reset)

let addCloneURL () = 
  print_endline (blue ^ "\nPlease paste GitHub Repository Link: " ^ reset);
  print_endline (cyan ^ "[i.e., https://github.com/yourname/your_repository]" ^ reset);
  let repoLink = input_line stdin in
  display_progress "Cloning repository...";
  if execute_git_command ("git clone " ^ repoLink) then
    print_endline (green ^ "✓ Repository cloned successfully!" ^ reset)
  else
    print_endline (red ^ "✗ Clone failed. Please check the repository URL and your permissions." ^ reset)

let display_menu () =
  print_endline (bold ^ "\n╭───── Available Commands ─────╮" ^ reset);
  print_endline (cyan ^ " c " ^ reset ^ "- Clone Repository");
  print_endline (cyan ^ " u " ^ reset ^ "- Update Current Repo");
  print_endline (cyan ^ " s " ^ reset ^ "- Show Status");
  print_endline (cyan ^ " b " ^ reset ^ "- Branch Management");
  print_endline (red ^ " q " ^ reset ^ "- Quit");
  print_endline (bold ^ "╰──────────────────────────────╯" ^ reset);;

let show_status () =
  print_endline (yellow ^ "\n📊 Current Repository Status:" ^ reset);
  ignore (Sys.command "git status");;

let branch_management () =
  print_endline (magenta ^ "\n🌿 Branch Management:" ^ reset);
  ignore (Sys.command "git branch");
  print_endline (blue ^ "\nEnter new branch name (or press Enter to cancel):" ^ reset);
  let branch_name = input_line stdin in
  if branch_name <> "" then
    if execute_git_command ("git checkout -b " ^ branch_name) then
      print_endline (green ^ "✓ Created and switched to new branch!" ^ reset)
    else
      print_endline (red ^ "✗ Failed to create branch" ^ reset);;

let commands = Hashtbl.create 10;;
let () = 
  Hashtbl.add commands "c" addCloneURL;
  Hashtbl.add commands "u" updateRepo;
  Hashtbl.add commands "s" show_status;
  Hashtbl.add commands "b" branch_management;;

let executeCommand userInput = 
  try
    let command = Hashtbl.find commands userInput in
    command ()
  with
  | Not_found -> print_endline (red ^ "Command not found!" ^ reset)

let rec main_loop () =
  display_menu ();
  print_string (bold ^ "\n→ Enter command: " ^ reset);
  let userInput = input_line stdin in
  if userInput = "q" then begin
    display_progress "Shutting down...";
    print_endline (green ^ "👋 Goodbye!" ^ reset)
  end else begin
    executeCommand userInput;
    main_loop ()
  end

let () = main_loop ();;
```
