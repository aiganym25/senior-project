import { Button, Card, Cascader, Col, Row } from "antd";
import { useEffect, useState } from 'react';
import { useNavigate } from "react-router";
import HrDocumentTemplatesService from "../../../../services/HrDocumentTemplatesService";
import HrDocumentService from "../../../../services/HrDocumentsService";
import ChooseForm from "./ChooseForm";
import DueDate from './DueDate';
import TabelEditor from "./TabelEditor";
import TagBlock from './TagBlock';
import doc1 from './docx/doc1';
import doc2 from './docx/doc2';
import doc3 from './docx/doc3';

const Index = () => {
    const [docArray, setDocArray] = useState([doc1, doc2, doc3]);
    const [hrDocTemp, setHrDocTemp] = useState([])
    const [hrDocTempID, setHrDocTempID] = useState(null)
    const [status, setStatus] = useState('')
    const [dueDate, setDueDate] = useState('')
    const [userID, setUserID] = useState('')

    const [inputInfo, setInputInfo] = useState([])
    const [cameTags, setCameTags] = useState([])
    const [user, setUser] = useState([])

    const [chooseOrder, setChooseOrder] = useState([])
    const [argSend, setArgSend] = useState([])
    const [argCome, setArgCome] = useState([])
    const [saveText, setSaveText] = useState([])
    const [choosed, setChoosed] = useState([])

    const navigate = useNavigate();

    function onClickCascader() {
        HrDocumentTemplatesService.hr_template().then(r => setChooseOrder(r))
    }

    let countIn = 0
    const onClickOption = async (val) => {
        setHrDocTempID(val)
        let choosed = []
        let text

        for (let i = 0; i < chooseOrder.length; i++) {
            // console.log(chooseOrder);
            if (chooseOrder[i].id == val) {

                choosed = chooseOrder[i]
                // console.log(item)
                text = docArray[i]
                setSaveText(text);
                setChoosed(choosed);
                console.log(text)
            }
        }

        // HrDocumentService.get_doc(text)
        //     .then((response) => {
        //         const file = response.data;

        //         if (!(file instanceof Blob)) {
        //             console.log("Downloaded file is not a Blob object");
        //         }

        //         const reader = new FileReader();

        //         reader.onload = () => {
        //             const arrayBuffer = reader.result;
        //             const zip = new PizZip(arrayBuffer);
        //             const doc = new Docxtemplater(zip, {
        //                 delimiters: { start: "[[", end: "]]" },
        //             })

        //             const textIn = doc.getFullText();
        //             const replacedText = textIn.replace(/{{/g, " ").replace(/}}/g, " ");
        //             // console.log(replacedText)

        //             setSaveText(replacedText)
        //         };

        //         reader.readAsArrayBuffer(file);
        //     })
        //     .catch((error) => {
        //         console.log(error);
        //     });

        let arr = []
        let dropdownItems

        for (const key in choosed.properties) {
            if (choosed.properties[key].data_taken == "matreshka" && choosed.properties[key].field_name !== null) {
                let optionWithChildren = []
                dropdownItems = await getDropdownItems({ option: choosed.properties[key].field_name, dataTaken: choosed.properties[key].data_taken, mId: null })

                for (let item of dropdownItems) {
                    let children = await getDropdownItems({ option: choosed.properties[key].field_name, dataTaken: choosed.properties[key].data_taken, mId: item.id })
                    optionWithChildren.push({
                        name: item.name,
                        id: item.id,
                        children: children
                    })
                }

                arr.push({
                    inputVal: choosed.properties[key].alias_name,
                    tagName: key,
                    id: countIn,
                    type: "dropdown",
                    field_name: choosed.properties[key].field_name,
                    dropdownItems: optionWithChildren,
                    children: optionWithChildren
                })

                countIn = countIn + 1
            }
            else if (choosed.properties[key].data_taken == 'dropdown' && choosed.properties[key].field_name !== null) {
                dropdownItems = await getDropdownItems({ option: choosed.properties[key].field_name, dataTaken: null, mId: null })
                arr.push({
                    inputVal: choosed.properties[key].alias_name,
                    tagName: key,
                    id: countIn,
                    type: choosed.properties[key].data_taken,
                    field_name: choosed.properties[key].field_name,
                    dropdownItems: dropdownItems,
                    children: undefined
                })
                countIn = countIn + 1
            }
            else if (choosed.properties[key].data_taken !== 'auto') {
                arr.push({
                    inputVal: choosed.properties[key].alias_name,
                    tagName: key,
                    id: countIn,
                    type: choosed.properties[key].data_taken,
                    field_name: choosed.properties[key].field_name,
                    dropdownItems: undefined,
                    children: undefined
                })
                countIn = countIn + 1
            }

        }

        let argSendInfo = {
            items: arr,
            changes: {}
        }

        setArgSend(argSendInfo)
    }

    async function getDropdownItems(field_name) {
        let dropdownItems = await HrDocumentService.getDropdownItems(field_name)

        return dropdownItems
    }

    useEffect(() => {
        let newArr = []
        newArr.push(choosed)

        
        let arrTags = [argSend.changes]
        let finished = [argSend]
        console.log(newArr[0])

        if (arrTags.length == 1) {
            arrTags = []
            for (const i in newArr[0].properties) {
                if (newArr[0].properties[i].type === 'read' && newArr[0].properties[i].data_taken === 'auto' && user[i] !== undefined) {
                    if(i == "rank"){
                        arrTags.push({ prevText: i, newText: user[i].name, findText: i })
                    }else{
                        arrTags.push({ prevText: i, newText: user[i], findText: i })
                    }
                }
            }
        }

        
        finished[0].changes = arrTags

        console.log("____________________________________________")
        console.log(user)
        console.log("____________________________________________")

        setArgSend(finished[0])    
    }, [user])

    function onClickButton() {
        // let arr2 = []

        // for (const i in choosed.properties) {
        //     if (choosed.properties[i].type === 'read' && choosed.properties[i].data_taken === 'auto' && user[i] !== undefined) {
        //         // if (arr2 == []) {
        //         //     const { key } = { key: i }
        //         //     arr2 = { [key]: user[i] }
        //         // } else {
        //         //     const { key } = { key: i }
        //         //     arr2[key] = i

        //         // }
        //         console.log(choosed.properties[i])
        //         arr2.push({
        //             inputVal: choosed.properties[i].alias_name,
        //             tagName: i,
        //             id: countIn,
        //             type: choosed.properties[i].data_taken,
        //             field_name: undefined,
        //             dropdownItems: undefined,
        //             children: undefined
        //         })
        //         countIn = countIn + 1
        //     }
        // }

        // setStatus(user.status)


        // for(let item of argSend.items){
        //     arr2.push(item)
        // }

        // setArgSend(arr2)
        // for (const i in argSend.items) {
        //     const { key } = { key: i }
        //     arr2[key] = argSend.items[i]
        // }

        // console.log("__________________________")
        // console.log(arr2)
        // console.log("__________________________")

        // console.log(arr2)
        // console.log(user)
        // console.log(status)

        // try {

        //     console.log('REQUEST SENDED')
        //     HrDocumentService.hr_document_post(hrDocTempID, status, dueDate, userID, arr).then(
        //         // navigate(`${APP_PREFIX_PATH}/management/letters`)

        //         )
        // } catch (e) {
        //     console.error(e);
        // }
    }

    function handleValueChange(newValue) {
        setInputInfo(newValue)
    }

    function propsChange(came) {
        setCameTags(came)
    }

    return (
        <div>
            <Row>
                <Col xl={3}>
                    <h4 style={{ marginTop: "5px" }}>Выбрать приказ:</h4>
                </Col>
                <Col xl={11}>
                    <Cascader
                        options={
                            chooseOrder.map(item => ({
                                value: item.id,
                                label: item.name
                            }))
                        }
                        onChange={onClickOption}
                        style={{ width: '60%' }}
                        onClick={onClickCascader}
                    />
                </Col>
                <Col xl={10} style={{ alignItems: "right" }}>
                    <Row>
                        <Col align={"end"} xl={11}>
                            <Button danger>Удалить</Button>
                        </Col>
                        <Col align={"end"} xl={6}>
                            <Button>Черновик</Button>
                        </Col>
                        <Col align={"end"} xl={7}>
                            <Button type="primary" onClick={onClickButton}>Иницировать</Button>
                        </Col>
                    </Row>
                </Col>
            </Row>

            <Row gutter={15} style={{ marginTop: "20px" }}>
                <Col xl={12}><TabelEditor argSend={{ tagsCome: argCome, textCome: saveText }} /></Col>
                <Col xl={12}>
                    <Card>
                        <Col xl={24}>
                            <ChooseForm onChildData={{ setUserID, setUser }} argSend={{ arg: argSend, all: choosed, take: setArgSend }} />
                            <TagBlock argSend={argSend} argCome={setArgCome} />
                        </Col>
                    </Card>
                    <Row><DueDate onChildDueDate={setDueDate} /></Row>
                </Col>
            </Row>

        </div>
    );
};

export default Index;