import { deleteContact } from "../../app/data";
import type { Route } from "./+types/destroy";
import { redirect } from "react-router";


export const action = async ({params}: Route.ActionArgs) => {
    await deleteContact(params.contactId);

    return redirect(`/`);
}