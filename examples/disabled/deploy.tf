module "disabled" {
  source = "../../"

  count = 0

  name          = "tftest"
  properties    = "tftest"
  job_queue_arn = "arn:aws:batch:ca-central-1:000000000000:job-queue/tftest"
}
