(* Author { @Override } | 1/7/2025 : 11:15 *)
(* ANSI color codes *)
let red = "\027[31m"
let green = "\027[32m"
let yellow = "\027[33m"
let blue = "\027[34m"
let magenta = "\027[35m"
let cyan = "\027[36m"
let reset = "\027[0m"
let bold = "\027[1m"
let printf = print_endline


let display_logo () =
  print_endline (cyan ^ bold ^ "
                                                       
   ____            __________ ____     ___      _      
  6MMMMb/ 68b      MMMMMMMMMM `MM'     `M'     dM.     
 8P    YM Y89   /  /   MM   \  MM       M     ,MMb     
6M      Y ___  /M      MM      MM       M     d'YM.    
MM        `MM /MMMMM   MM      MM       M    ,P `Mb    
MM         MM  MM      MM      MM       M    d'  YM.   
MM     ___ MM  MM      MM      MM       M   ,P   `Mb   
MM     `M' MM  MM      MM      MM       M   d'    YM.  
YM      M  MM  MM      MM      YM       M  ,MMMMMMMMb  
 8b    d9  MM  YM.  ,  MM       8b     d8  d'      YM. 
  YMMMM9  _MM_  YMMM9 _MM_       YMMMMM9 _dM_     _dMM_
----------------------------------------------------------
    - Meticulously Crafted by @Override and Jakub -
        " ^ reset);
  print_endline (magenta ^ "  Git [T]erminal [U]ser [A]pplication {SPIT ON THAT THANG!!}" ^ reset);
  print_endline "";;


(* Just using this to create the progression Bar *)
let display_progress msg =
  print_string (msg ^ " ");
  for i = 0 to 20 do
    print_string (green ^ "█" ^ reset);
    flush stdout;
  done;
  print_endline "";;

let _ = Sys.command "clear";; 
display_logo ();;

print_endline (blue ^ bold ^ "Please Enter Github Profile Name: " ^ reset);;
let name = input_line stdin;;


(* 
   Beatiful pattern matching (you can actually do this in Java now too I guess...)
   but this just simply checks the command that is being passed ->
       - if the command is valid (AKA 0), then it returns true else flase...  
       _ is a wildcard in Ocaml meaning the remaining values.
*)
let execute_git_command cmd =
  match Sys.command cmd with
  | 0 -> true
  | _ -> false

let updateRepo () =
  display_progress "Fetching updates...";
  if execute_git_command "git fetch" then begin
    display_progress "Pulling changes...";
    if execute_git_command "git pull" then
      printf(green ^ "✓ Successfully updated!" ^ reset)
    else
      printf(yellow ^ "⚠ Successfully fetched, but pull failed" ^ reset)
  end else 
    printf(red ^ "✗ Fetch failed" ^ reset)

let addCloneURL () = 
  printf(blue ^ "\nPlease paste GitHub Repository Link: " ^ reset);
  printf(cyan ^ "[i.e., https://github.com/yourname/your_repository]" ^ reset);
  let repoLink = input_line stdin in
  display_progress "Cloning repository...";
  if execute_git_command ("git clone " ^ repoLink) then
    printf(green ^ "✓ Repository cloned successfully!" ^ reset)
  else
    printf(red ^ "✗ Clone failed. Please check the repository URL and your permissions." ^ reset)

let display_menu () =
  printf(bold ^ "\n╭───── Available Commands ─────╮" ^ reset);
  printf(bold^ cyan ^ " cl " ^ reset ^ "- Clone Repository");
  printf(cyan ^ " rugPull" ^ reset ^ "- Update Current Repo");
  printf(cyan ^ " s " ^ reset ^ "- Show Status");
  printf(cyan ^ " b " ^ reset ^ "- Branch Management");
  printf(cyan ^ " p" ^ green ^ "- Push Current " ^ reset);
  printf(cyan ^ " gitTUA" ^ green ^ "- send and SPIT ON THAT THANG" ^ reset);
  printf(red ^ " q " ^ reset ^ "- Quit");
  printf(bold ^ "╰──────────────────────────────╯" ^ reset);;

let showStatus() =
  printf(yellow ^ "\n📊 Current Repository Status:" ^ reset);
  ignore (Sys.command "git status");;

let gitPush() =
    printf("\nI worked");;
    

let branch_management () =
  printf(magenta ^ "\n🌿 Branch Management:" ^ reset);
  ignore (Sys.command "git branch");
  printf(blue ^ "\nEnter new branch name (or press Enter to cancel):" ^ reset);
  let branch_name = input_line stdin in
  if branch_name <> "" then
    if execute_git_command ("git checkout -b " ^ branch_name) then
      printf(green ^ "✓ Created and switched to new branch!" ^ reset)
    else
      printf(red ^ "✗ Failed to create branch" ^ reset);;

let commands = Hashtbl.create 14;;
let () = 
  Hashtbl.add commands "cl" addCloneURL;
  Hashtbl.add commands "rugPull" updateRepo;
  Hashtbl.add commands "s" showStatus;
  Hashtbl.add commands "b" branch_management;;
  Hashtbl.add commands "gitTua" gitPush;;

let executeCommand userInput = 
  try
    let command = Hashtbl.find commands userInput in
    command ()
  with
  | Not_found -> printf(red ^ "Command not found!" ^ reset)


let _ = Sys.command "clear" ;;
let rec main_loop () =

  display_menu ();
  print_string (bold ^ "\n→ Enter command: " ^ reset);
  let userInput = input_line stdin in
  if userInput = "q" then begin
    display_progress "Shutting down...";
    printf(green ^ "👋 Goodbye!" ^ reset)
  end else begin
    executeCommand userInput;
    main_loop ()
  end

let () = main_loop ();;
