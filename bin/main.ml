(* open Lwt *)

let () =
  let body = RestClient.fetch_body "http://localhost:3000" in
  (* print out body, which is type string t *)
  (* this is just a comment*)
  Printf.printf "%s" (Lwt_main.run body)
;;
