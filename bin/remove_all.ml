(*
 * Copyright (c) 2009  Dustin Sallings <dustin@spy.net>
 *)

open Beanstalk

let get_job bs =
  try
    Some (Beanstalk.reserve_with_timeout bs 0)
  with Beanstalk.Timeout -> (
    None
  )

let rec dump bs =
  match (get_job bs) with
    None -> ()
  | Some job ->
      Beanstalk.delete bs job.job_id;
      Printf.printf "Whacked job %d\n" job.job_id;
      dump bs

let main () =
  let bs = Beanstalk.connect Sys.argv.(1) 11300 in
  dump bs;
  Beanstalk.shutdown bs
;;

if !Sys.interactive then () else begin main() end
