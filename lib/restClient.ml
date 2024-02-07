open Lwt
(* open Cohttp *)
open Cohttp_lwt_unix

let fetch_body url =
  Client.get (Uri.of_string url) >>= fun (resp, body) ->
    let status = resp |> Response.status in
    match status with
    | `OK ->
      body |> Cohttp_lwt.Body.to_string >|= fun body ->
        body
    | _ ->
      Printf.printf "Error: %s\n" (Cohttp.Code.string_of_status status);
      Lwt.return ""

