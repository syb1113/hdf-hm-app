import { rcpGET } from '../utils/http';
import { rcp } from '@kit.RemoteCommunicationKit';

export  function getHospitalInfo(): Promise<rcp.Response> {
  return rcpGET("/doctors/hospitals")
}